using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class TesseractDemoCam : MonoBehaviour
{
    //public Texture2D imageToRecognize;
    [SerializeField] public Text displayText;
    [SerializeField] public RawImage outputImage;
    private NativeCam ncam;
    private static readonly List<string> fileNames = new List<string> { "tessdata.tgz" };
    private Texture2D imageToRecognize;
    //[SerializeField] private Text displayText;
    //[SerializeField] private RawImage outputImage;


    private TesseractDriver _tesseractDriver;
    private string _text = "";
    private Texture2D _texture;
    // Use this for initialization
    void Start()
    {
        //if (ncam.ResimCek(512) != null)
        //{
        //    imageToRecognize = ncam.ResimCek(512);
        //}

        //Texture2D texture = new Texture2D(imageToRecognize.width, imageToRecognize.height, TextureFormat.ARGB32, false);
        //texture.SetPixels32(imageToRecognize.GetPixels32());
        //texture.Apply();
        //_tesseractDriver = new TesseractDriver();
        //if (imageToRecognize != null)
        //    Recognize(texture);
        //SetImageDisplay();
        ncam.ResimCek(512);


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
                //imageToRecognize = ncam.ResimCek(512);
                //if (imageToRecognize != null)
                //{
                //    Texture2D texture = new Texture2D(imageToRecognize.width, imageToRecognize.height, TextureFormat.ARGB32, false);
                //    texture.SetPixels32(imageToRecognize.GetPixels32());
                //    texture.Apply();
                //    _tesseractDriver = new TesseractDriver();
                //    Recognize(imageToRecognize);
                //}
                //Debug.Log("sol yarıya tıklandı");
            }

        }
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
