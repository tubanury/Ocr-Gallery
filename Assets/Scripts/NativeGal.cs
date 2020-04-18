using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class NativeGal : MonoBehaviour
{
	[SerializeField] public RawImage outputImage;
	private TesseractDriver _tesseractDriver;
	private Texture2D _texture;
	[SerializeField] public Text displayText;
	private string _text = "";
	[SerializeField] private Texture2D imageToRecognize;

	// Use this for initialization
	void Start()
    {
		
		PickImage(512);
		//Texture2D texture = new Texture2D(imageToRecognize.width, imageToRecognize.height, TextureFormat.ARGB32, false);
		//texture.SetPixels32(imageToRecognize.GetPixels32());
		//texture.Apply();
		_tesseractDriver = new TesseractDriver();
		//if (imageToRecognize != null)
			//Recognize(texture);
	}

	// Update is called once per frame
	void Update()
	{
	

	}
	private IEnumerator TakeScreenshotAndSave()
	{
		yield return new WaitForEndOfFrame();

		Texture2D ss = new Texture2D(Screen.width, Screen.height, TextureFormat.RGB24, false);
		ss.ReadPixels(new Rect(0, 0, Screen.width, Screen.height), 0, 0);
		ss.Apply();

		// Save the screenshot to Gallery/Photos
		Debug.Log("Permission result: " + NativeGallery.SaveImageToGallery(ss, "GalleryTest", "Image.png"));

		// To avoid memory leaks
		Destroy(ss);
	}

	private Texture2D PickImage(int maxSize)
	{
		NativeGallery.Permission permission = NativeGallery.GetImageFromGallery((path) =>
		{
			Debug.Log("Image path: " + path);
			if (path != null)
			{
				// Create Texture from selected image
				Texture2D texture = NativeGallery.LoadImageAtPath(path, maxSize);
				Debug.Log("*************************************");
				Debug.Log(texture.isReadable);
				if (texture == null)
				{
					Debug.Log("Couldn't load texture from " + path);
					return;
				}

				// Assign texture to a temporary quad and destroy it after 5 seconds
				GameObject quad = GameObject.CreatePrimitive(PrimitiveType.Quad);
				quad.transform.position = Camera.main.transform.position + Camera.main.transform.forward * 2.5f;
				quad.transform.forward = Camera.main.transform.forward;
				quad.transform.localScale = new Vector3(1f, texture.height / (float)texture.width, 1f);

				Material material = quad.GetComponent<Renderer>().material;
				if (!material.shader.isSupported) // happens when Standard shader is not included in the build
					material.shader = Shader.Find("Legacy Shaders/Diffuse");

				material.mainTexture = texture;
				Texture2D texture2 = new Texture2D(texture.width, texture.height, TextureFormat.ARGB32, false);
				Color32[] pixelBlock = null;
				try
				{
					pixelBlock = texture.GetPixels32();
				}
				catch (UnityException _e)
				{
					texture.filterMode = FilterMode.Point;
					RenderTexture rt = RenderTexture.GetTemporary(texture.width, texture.height);
					rt.filterMode = FilterMode.Point;
					RenderTexture.active = rt;
					Graphics.Blit(texture, rt);
					Texture2D img2 = new Texture2D(texture.width, texture.height);
					img2.ReadPixels(new Rect(0, 0, texture.width, texture.height), 0, 0);
					img2.Apply();
					RenderTexture.active = null;
					texture = img2;
					pixelBlock = texture.GetPixels32();
				}
				texture2.SetPixels32(pixelBlock);
				texture2.Apply();
				
				Recognize(texture2);
				Destroy(quad, 5f);

				// If a procedural texture is not destroyed manually, 
				// it will only be freed after a scene change
				Destroy(texture, 5f);
			}
		}, "Select a PNG image", "image/png");

		Debug.Log("Permission result: " + permission);
		return _texture;
	}
	private void Recognize(Texture2D outputTexture)
	{
		_texture = outputTexture;
		ClearTextDisplay();
		AddToTextDisplay(_tesseractDriver.CheckTessVersion());
		_tesseractDriver.Setup(OnSetupCompleteRecognize);
		//Debug.Log("Setup başarılı");
		//AddToTextDisplay(_tesseractDriver.Recognize(outputTexture));
		//AddToTextDisplay(_tesseractDriver.GetErrorMessage(), true);
	}
	private void OnSetupCompleteRecognize()
	{
		AddToTextDisplay(_tesseractDriver.Recognize(_texture));
		AddToTextDisplay(_tesseractDriver.GetErrorMessage(), true);
		SetImageDisplay();

		//AddToTextDisplay(_tesseractDriver.Recognize(outputTexture));
		//AddToTextDisplay(_tesseractDriver.GetErrorMessage(), true);
	}

	private void ClearTextDisplay()
	{
		_text = "";
	}

	private void AddToTextDisplay(string text, bool isError = false)
	{
		if (string.IsNullOrWhiteSpace(text)) return;

		_text += (string.IsNullOrWhiteSpace(displayText.text) ? "" : "\n") + text;

		if (isError)
			Debug.LogError(_text);
		else
			Debug.Log(_text);
	}

	private void LateUpdate()
	{
		if (displayText.text != null && _text != null)
			displayText.text = _text;
	}

	private void SetImageDisplay()
	{
		RectTransform rectTransform = outputImage.GetComponent<RectTransform>();
		rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical,
			rectTransform.rect.width * _tesseractDriver.GetHighlightedTexture().height / _tesseractDriver.GetHighlightedTexture().width);
		outputImage.texture = _tesseractDriver.GetHighlightedTexture();
	}



}
