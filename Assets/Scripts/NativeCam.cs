using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class NativeCam : MonoBehaviour
{
    [SerializeField] public RawImage outputImage;
    private TesseractDriver _tesseractDriver;
    [SerializeField] public Text displayText;
    private string _text = "";
    private Texture2D texture2;
    private Texture2D _texture;
    private static readonly List<string> fileNames = new List<string> { "tessdata.tgz" };
    // Start is called before the first frame update
    void Start()
    {
        _tesseractDriver = new TesseractDriver();
        ResimCek(512);
    }
    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            // Eğer kamera meşgulse bir şey yapma
            if (NativeCamera.IsCameraBusy())
                return;

            if (Input.mousePosition.x < Screen.width / 2)
            {
                // Kamera ile resim çek
                // Eğer resmin genişliği veya yüksekliği 512 pikselden büyükse, resmi ufalt
                //ResimCek(512);
                //Debug.Log("sol yarıya tıklandı");
            }
          
        }
    }
    public void ResimCek(int maksimumBuyukluk)
    {
        NativeCamera.Permission izin = NativeCamera.TakePicture((konum) =>
        {
            Debug.Log("Çekilen resmin konumu: " + konum);
            if (konum != null)
            {
                // Çekilen resmi bir Texture2D'ye çevir
                Texture2D texture = NativeCamera.LoadImageAtPath(konum, maksimumBuyukluk, false);
                if (texture == null)
                {
                    Debug.Log(konum + " konumundaki resimden bir texture oluşturulamadı.");
                    return;
                }

                // Texture'u geçici bir küp objesine ver
                GameObject kup = GameObject.CreatePrimitive(PrimitiveType.Cube);
                kup.transform.position = Camera.main.transform.position + Camera.main.transform.forward * 5f;
                kup.transform.forward = -Camera.main.transform.forward;
                kup.transform.localScale = new Vector3(1f, texture.height / (float)texture.width, 1f);

                Material material = kup.GetComponent<Renderer>().material;
                if (!material.shader.isSupported) // eğer Standard shader desteklenmiyorsa Diffuse shader'ı kullan
                    material.shader = Shader.Find("Legacy Shaders/Diffuse");

                Recognize(texture);
                material.mainTexture = texture;
                //Texture2D texture2 = new Texture2D(texture.width, texture.height, TextureFormat.ARGB32, false);
                //texture2.SetPixels32(texture.GetPixels32());
                //texture2.Apply();
                
                // 5 saniye sonra küp objesini yok et
                Destroy(kup, 5f);
                
                // Küp objesi ile birlikte Texture2D objesini de yok et
                // Eğer prosedürel bir objeyi (Texture2D) işiniz bitince yok etmezseniz,
                // mevcut scene'i değiştirene kadar obje hafızada kalmaya devam eder
                //Destroy(texture, 5f);
            }
        }, maksimumBuyukluk);

        Debug.Log("İzin durumu: " + izin);

      
    }
    private void Recognize(Texture2D outputTexture)
    {
        Debug.Log("Recognize a geldi");
        Debug.Log(outputTexture.height);
        Debug.Log(outputTexture == null);
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
        if (string.IsNullOrWhiteSpace(text))
        {
            Debug.Log("Null geldi add text");
            return;
        }

        _text += (string.IsNullOrWhiteSpace(displayText.text) ? "" : "\n") + text;

        if (isError)
            Debug.LogError(text);
        else
            Debug.Log(text);
    }

    private void LateUpdate()
    {
        Debug.Log(displayText.text);
        Debug.Log(_text);

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
