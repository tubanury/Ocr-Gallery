.class public Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;
.super Landroid/app/Fragment;
.source "NativeGalleryMediaPickerFragment.java"


# static fields
.field private static final MEDIA_REQUEST_CODE:I = 0xf113f

.field public static final MEDIA_TYPE_ID:Ljava/lang/String; = "NGMP_MEDIA_TYPE"

.field public static final MIME_ID:Ljava/lang/String; = "NGMP_MIME"

.field public static final SAVE_PATH_ID:Ljava/lang/String; = "NGMP_SAVE_PATH"

.field public static final SELECT_MULTIPLE_ID:Ljava/lang/String; = "NGMP_MULTIPLE"

.field public static final TITLE_ID:Ljava/lang/String; = "NGMP_TITLE"

.field public static preferGetContent:Z = false

.field private static secondaryStoragePath:Ljava/lang/String; = null

.field public static tryPreserveFilenames:Z = false


# instance fields
.field private final mediaReceiver:Lcom/yasirkula/unity/NativeGalleryMediaReceiver;

.field private savePathDirectory:Ljava/lang/String;

.field private savePathFilename:Ljava/lang/String;

.field private savedFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private selectMultiple:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 52
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    const/4 v0, 0x0

    .line 53
    iput-object v0, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeGalleryMediaReceiver;

    return-void
.end method

.method public constructor <init>(Lcom/yasirkula/unity/NativeGalleryMediaReceiver;)V
    .locals 0

    .line 57
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeGalleryMediaReceiver;

    return-void
.end method

.method private allowMultipleMedia(Landroid/content/Intent;)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const-string v0, "android.intent.extra.ALLOW_MULTIPLE"

    const/4 v1, 0x1

    .line 110
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-void
.end method

.method private copyToTempFile(Landroid/net/Uri;)Ljava/lang/String;
    .locals 11

    const-string v0, "Exception:"

    const-string v1, "Unity"

    .line 305
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, v2

    move-object v4, p1

    .line 311
    :try_start_0
    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v3, :cond_0

    .line 312
    :try_start_1
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "_display_name"

    .line 313
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto/16 :goto_8

    :catch_0
    move-exception v4

    goto :goto_1

    :cond_0
    move-object v4, v9

    :goto_0
    if-eqz v3, :cond_2

    .line 322
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    goto :goto_2

    :catchall_1
    move-exception p1

    move-object v3, v9

    goto/16 :goto_8

    :catch_1
    move-exception v4

    move-object v3, v9

    .line 317
    :goto_1
    :try_start_2
    invoke-static {v1, v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_1

    .line 322
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_1
    move-object v4, v9

    :cond_2
    :goto_2
    if-eqz v4, :cond_3

    .line 325
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v5, 0x3

    if-ge v3, v5, :cond_4

    :cond_3
    const-string v4, "temp"

    .line 329
    :cond_4
    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 331
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/webkit/MimeTypeMap;->getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    :cond_5
    const-string v3, ".tmp"

    .line 335
    :goto_3
    invoke-virtual {v4, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_6

    .line 336
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v5, v7

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 340
    :cond_6
    :try_start_3
    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    if-nez p1, :cond_7

    return-object v9

    .line 344
    :cond_7
    sget-boolean v2, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->tryPreserveFilenames:Z

    if-eqz v2, :cond_8

    move-object v2, v4

    goto :goto_4

    :cond_8
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savePathFilename:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 345
    :goto_4
    iget-object v5, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savedFiles:Ljava/util/ArrayList;

    if-eqz v5, :cond_b

    const/4 v5, 0x1

    move-object v7, v2

    move v8, v5

    move v2, v6

    .line 348
    :goto_5
    iget-object v10, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savedFiles:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v2, v10, :cond_a

    .line 350
    iget-object v10, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savedFiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    add-int/lit8 v8, v8, 0x1

    .line 353
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v2, -0x1

    :cond_9
    add-int/2addr v2, v5

    goto :goto_5

    :cond_a
    move-object v2, v7

    .line 359
    :cond_b
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savePathDirectory:Ljava/lang/String;

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 363
    :try_start_4
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    const/16 v5, 0x1000

    .line 365
    :try_start_5
    new-array v5, v5, [B

    .line 367
    :goto_6
    invoke-virtual {p1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v7

    if-lez v7, :cond_c

    .line 369
    invoke-virtual {v4, v5, v6, v7}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_6

    .line 372
    :cond_c
    iget-boolean v5, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->selectMultiple:Z

    if-eqz v5, :cond_e

    .line 374
    iget-object v5, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savedFiles:Ljava/util/ArrayList;

    if-nez v5, :cond_d

    .line 375
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savedFiles:Ljava/util/ArrayList;

    .line 377
    :cond_d
    iget-object v5, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savedFiles:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 380
    :cond_e
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 385
    :try_start_6
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 387
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    return-object v2

    :catchall_2
    move-exception v2

    goto :goto_7

    :catchall_3
    move-exception v2

    move-object v4, v9

    :goto_7
    if-eqz v4, :cond_f

    .line 385
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 387
    :cond_f
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    throw v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    :catch_2
    move-exception p1

    .line 392
    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v9

    :goto_8
    if-eqz v3, :cond_10

    .line 322
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_10
    throw p1
.end method

.method private fetchPathsOfMultipleMedia(Ljava/util/ArrayList;Landroid/content/Intent;)V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Intent;",
            ")V"
        }
    .end annotation

    .line 117
    invoke-virtual {p2}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 119
    invoke-virtual {p2}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ClipData;->getItemCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 122
    invoke-virtual {p2}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getPathFromURI(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 125
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 127
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getPathFromURI(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method private getPathFromURI(Landroid/net/Uri;)Ljava/lang/String;
    .locals 10

    const-string v0, "_data"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    return-object v1

    .line 137
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Selected media uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Unity"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v2, v4, :cond_1

    invoke-static {}, Landroid/os/Environment;->isExternalStorageLegacy()Z

    move-result v2

    if-nez v2, :cond_1

    .line 141
    invoke-direct {p0, p1}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->copyToTempFile(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 148
    :cond_1
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-lt v2, v4, :cond_b

    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_b

    const-string v2, "com.android.externalstorage.documents"

    .line 150
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const-string v4, "raw"

    const-string v5, ":"

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v2, :cond_4

    .line 152
    :try_start_1
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    .line 153
    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const-string v0, "primary"

    .line 155
    aget-object v2, p1, v6

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object p1, p1, v7

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 157
    :cond_2
    aget-object v0, p1, v6

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 158
    aget-object p1, p1, v7

    return-object p1

    .line 160
    :cond_3
    aget-object p1, p1, v7

    invoke-direct {p0, p1}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getSecondaryStoragePathFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    const-string v2, "com.android.providers.downloads.documents"

    .line 162
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 164
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "raw:"

    .line 165
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v0, 0x4

    .line 166
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_5
    const-string v2, "content://downloads/public_downloads"

    .line 168
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {v2, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    goto :goto_1

    :cond_6
    const-string v2, "com.android.providers.media.documents"

    .line 170
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 172
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 173
    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 174
    aget-object v5, v2, v6

    const-string v8, "image"

    .line 175
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 176
    sget-object p1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_7
    const-string v8, "video"

    .line 177
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 178
    sget-object p1, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_8
    const-string v8, "audio"

    .line 179
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 180
    sget-object p1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0

    .line 181
    :cond_9
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 182
    aget-object p1, v2, v7

    return-object p1

    :cond_a
    :goto_0
    const-string v4, "_id=?"

    .line 185
    new-array v5, v7, [Ljava/lang/String;

    aget-object v2, v2, v7

    aput-object v2, v5, v6

    move-object v7, v4

    move-object v8, v5

    goto :goto_2

    :cond_b
    :goto_1
    move-object v7, v1

    move-object v8, v7

    :goto_2
    const-string v2, "content"

    .line 189
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 191
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 196
    :try_start_2
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v9, 0x0

    move-object v5, p1

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v2, :cond_d

    .line 199
    :try_start_3
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    .line 200
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 202
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 203
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-lez v4, :cond_d

    if-eqz v2, :cond_c

    .line 214
    :try_start_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_c
    return-object v0

    :catchall_0
    move-exception p1

    goto :goto_4

    :cond_d
    if-eqz v2, :cond_10

    :goto_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_5

    :catchall_1
    move-exception p1

    move-object v2, v1

    :goto_4
    if-eqz v2, :cond_e

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_e
    throw p1

    :catch_0
    move-object v2, v1

    :catch_1
    if-eqz v2, :cond_10

    goto :goto_3

    :cond_f
    const-string v0, "file"

    .line 217
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 218
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 221
    :cond_10
    :goto_5
    invoke-direct {p0, p1}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->copyToTempFile(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    return-object p1

    :catch_2
    move-exception p1

    const-string v0, "Exception:"

    .line 225
    invoke-static {v3, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1
.end method

.method private getSecondaryStoragePathFor(Ljava/lang/String;)Ljava/lang/String;
    .locals 12

    .line 232
    sget-object v0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->secondaryStoragePath:Ljava/lang/String;

    const-string v1, "_NulL_"

    if-nez v0, :cond_8

    .line 234
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v2, "SECONDARY_STORAGE"

    .line 238
    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 239
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    const-string v2, "EXTERNAL_SDCARD_STORAGE"

    .line 240
    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_1
    const/4 v3, 0x0

    if-eqz v2, :cond_4

    .line 242
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_4

    const-string v4, ":"

    .line 244
    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 245
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 247
    :cond_2
    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    move v4, v3

    .line 248
    :goto_0
    array-length v5, v2

    if-ge v4, v5, :cond_4

    .line 250
    aget-object v5, v2, v4

    if-eqz v5, :cond_3

    .line 251
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_3

    .line 253
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 254
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v6}, Ljava/io/File;->canRead()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 256
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 257
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 259
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->secondaryStoragePath:Ljava/lang/String;

    return-object v5

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    const-string v5, "/storage"

    const-string v6, "/mnt"

    const-string v7, "/storage/removable"

    const-string v8, "/removable"

    const-string v9, "/data"

    const-string v10, "/mnt/media_rw"

    const-string v11, "/mnt/sdcard0"

    .line 269
    filled-new-array/range {v5 .. v11}, [Ljava/lang/String;

    move-result-object v2

    .line 271
    array-length v4, v2

    move v5, v3

    :goto_1
    if-ge v5, v4, :cond_7

    aget-object v6, v2, v5

    .line 275
    :try_start_0
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v6

    .line 276
    array-length v7, v6

    move v8, v3

    :goto_2
    if-ge v8, v7, :cond_6

    aget-object v9, v6, v8

    .line 278
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-virtual {v9}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-virtual {v9}, Ljava/io/File;->canRead()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 280
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 281
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 283
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    sput-object v6, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->secondaryStoragePath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v10

    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :catch_0
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 294
    :cond_7
    sput-object v1, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->secondaryStoragePath:Ljava/lang/String;

    goto :goto_3

    .line 296
    :cond_8
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 297
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->secondaryStoragePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_9
    :goto_3
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const v0, 0xf113f

    if-eq p1, v0, :cond_0

    return-void

    .line 404
    :cond_0
    iget-boolean p1, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->selectMultiple:Z

    const/4 v0, -0x1

    const-string v1, ""

    if-nez p1, :cond_5

    if-ne p2, v0, :cond_2

    if-nez p3, :cond_1

    goto :goto_0

    .line 411
    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getPathFromURI(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_3

    :cond_2
    :goto_0
    move-object p1, v1

    .line 416
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_4

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_4

    move-object p1, v1

    .line 419
    :cond_4
    iget-object p2, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeGalleryMediaReceiver;

    if-eqz p2, :cond_c

    .line 420
    invoke-interface {p2, p1}, Lcom/yasirkula/unity/NativeGalleryMediaReceiver;->OnMediaReceived(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 424
    :cond_5
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    if-ne p2, v0, :cond_6

    if-eqz p3, :cond_6

    .line 426
    invoke-direct {p0, p1, p3}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->fetchPathsOfMultipleMedia(Ljava/util/ArrayList;Landroid/content/Intent;)V

    .line 428
    :cond_6
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    :goto_1
    if-ltz p2, :cond_9

    .line 430
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_7

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p3

    if-eqz p3, :cond_7

    new-instance p3, Ljava/io/File;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p3

    if-nez p3, :cond_8

    .line 431
    :cond_7
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_8
    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    :cond_9
    const/4 p2, 0x0

    .line 435
    :goto_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p3

    if-ge p2, p3, :cond_b

    if-nez p2, :cond_a

    .line 438
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_3

    .line 440
    :cond_a
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ">"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    :goto_3
    move-object v1, p3

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 443
    :cond_b
    iget-object p1, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeGalleryMediaReceiver;

    if-eqz p1, :cond_c

    .line 444
    invoke-interface {p1, v1}, Lcom/yasirkula/unity/NativeGalleryMediaReceiver;->OnMultipleMediaReceived(Ljava/lang/String;)V

    .line 447
    :cond_c
    :goto_4
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 64
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 65
    iget-object p1, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeGalleryMediaReceiver;

    if-nez p1, :cond_0

    .line 66
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    goto/16 :goto_3

    .line 69
    :cond_0
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "NGMP_MEDIA_TYPE"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    .line 70
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "NGMP_MIME"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 71
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "NGMP_TITLE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 72
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "NGMP_MULTIPLE"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->selectMultiple:Z

    .line 73
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "NGMP_SAVE_PATH"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2f

    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    if-ltz v3, :cond_1

    add-int/lit8 v4, v3, 0x1

    .line 76
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_1
    move-object v4, v2

    :goto_0
    iput-object v4, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savePathFilename:Ljava/lang/String;

    if-lez v3, :cond_2

    const/4 v4, 0x0

    .line 77
    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    :goto_1
    iput-object v2, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->savePathDirectory:Ljava/lang/String;

    .line 80
    sget-boolean v2, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->preferGetContent:Z

    if-nez v2, :cond_5

    iget-boolean v2, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->selectMultiple:Z

    if-nez v2, :cond_5

    const-string v2, "android.intent.action.PICK"

    if-nez p1, :cond_3

    .line 83
    new-instance p1, Landroid/content/Intent;

    sget-object v3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_2

    :cond_3
    const/4 v3, 0x1

    if-ne p1, v3, :cond_4

    .line 85
    new-instance p1, Landroid/content/Intent;

    sget-object v3, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_2

    .line 87
    :cond_4
    new-instance p1, Landroid/content/Intent;

    sget-object v3, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_2

    .line 91
    :cond_5
    new-instance p1, Landroid/content/Intent;

    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "android.intent.category.OPENABLE"

    .line 92
    invoke-virtual {p1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 94
    iget-boolean v2, p0, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->selectMultiple:Z

    if-eqz v2, :cond_6

    .line 95
    invoke-direct {p0, p1}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->allowMultipleMedia(Landroid/content/Intent;)V

    .line 98
    :cond_6
    :goto_2
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    if-eqz v1, :cond_7

    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_7

    const-string v0, "android.intent.extra.TITLE"

    .line 101
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 103
    :cond_7
    invoke-static {p1, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    const v0, 0xf113f

    invoke-virtual {p0, p1, v0}, Lcom/yasirkula/unity/NativeGalleryMediaPickerFragment;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_3
    return-void
.end method
