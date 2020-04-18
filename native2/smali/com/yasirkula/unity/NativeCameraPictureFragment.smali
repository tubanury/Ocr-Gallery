.class public Lcom/yasirkula/unity/NativeCameraPictureFragment;
.super Landroid/app/Fragment;
.source "NativeCameraPictureFragment.java"


# static fields
.field public static final AUTHORITY_ID:Ljava/lang/String; = "UNCP_AUTHORITY"

.field private static final CAMERA_PICTURE_CODE:I = 0x87718

.field public static final DEFAULT_CAMERA_ID:Ljava/lang/String; = "UNCP_DEF_CAMERA"

.field private static final IMAGE_NAME:Ljava/lang/String; = "IMG_camera.jpg"


# instance fields
.field private fileTargetPath:Ljava/lang/String;

.field private lastImageId:I

.field private final mediaReceiver:Lcom/yasirkula/unity/NativeCameraMediaReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/yasirkula/unity/NativeCameraPictureFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeCameraMediaReceiver;

    return-void
.end method

.method public constructor <init>(Lcom/yasirkula/unity/NativeCameraMediaReceiver;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/yasirkula/unity/NativeCameraPictureFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeCameraMediaReceiver;

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 17

    move-object/from16 v1, p0

    const-string v0, "_id"

    const-string v2, "_size"

    const-string v3, "_data"

    const-string v4, "Exception:"

    const-string v5, "Unity"

    const v6, 0x87718

    move/from16 v7, p1

    if-eq v7, v6, :cond_0

    return-void

    :cond_0
    const/4 v6, -0x1

    const-string v7, ""

    move/from16 v9, p2

    if-ne v9, v6, :cond_4

    .line 117
    new-instance v6, Ljava/io/File;

    iget-object v9, v1, Lcom/yasirkula/unity/NativeCameraPictureFragment;->fileTargetPath:Ljava/lang/String;

    invoke-direct {v6, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 119
    iget v9, v1, Lcom/yasirkula/unity/NativeCameraPictureFragment;->lastImageId:I

    int-to-long v9, v9

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-eqz v9, :cond_5

    .line 126
    :try_start_0
    filled-new-array {v3, v2, v0}, [Ljava/lang/String;

    move-result-object v12

    .line 127
    invoke-virtual/range {p0 .. p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    sget-object v11, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v13, "_id>?"

    const/4 v9, 0x1

    new-array v14, v9, [Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v1, Lcom/yasirkula/unity/NativeCameraPictureFragment;->lastImageId:I

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/16 v16, 0x0

    aput-object v8, v14, v16

    const-string v15, "_id DESC"

    invoke-virtual/range {v10 .. v15}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v8, :cond_2

    .line 129
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 131
    invoke-interface {v8, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v8, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 132
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_2

    .line 136
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 137
    invoke-interface {v8, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    .line 138
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v13
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    cmp-long v0, v11, v13

    if-lez v0, :cond_1

    .line 145
    :try_start_2
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, v10}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 149
    :try_start_3
    invoke-static {v5, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v0, 0x0

    .line 153
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v11, v6, v0}, Lcom/yasirkula/unity/NativeCameraUtils;->CopyFile(Landroid/content/Context;Ljava/io/File;Ljava/io/File;Landroid/net/Uri;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move v0, v9

    goto :goto_1

    .line 159
    :cond_1
    :try_start_4
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    xor-int/2addr v0, v9

    goto :goto_1

    :catch_1
    move-exception v0

    .line 164
    :try_start_5
    invoke-static {v5, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move/from16 v0, v16

    :goto_1
    if-eqz v0, :cond_2

    .line 168
    sget-boolean v0, Lcom/yasirkula/unity/NativeCamera;->KeepGalleryReferences:Z

    if-nez v0, :cond_2

    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Trying to delete duplicate gallery item: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-virtual/range {p0 .. p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v3, "_id=?"

    new-array v9, v9, [Ljava/lang/String;

    aput-object v10, v9, v16

    invoke-virtual {v0, v2, v3, v9}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    :catch_2
    move-exception v0

    goto :goto_3

    :cond_2
    :goto_2
    if-eqz v8, :cond_5

    goto :goto_4

    :catchall_0
    move-exception v0

    const/4 v8, 0x0

    goto :goto_5

    :catch_3
    move-exception v0

    const/4 v8, 0x0

    .line 180
    :goto_3
    :try_start_6
    invoke-static {v5, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v8, :cond_5

    .line 185
    :goto_4
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_6

    :catchall_1
    move-exception v0

    :goto_5
    if-eqz v8, :cond_3

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0

    :cond_4
    const/4 v6, 0x0

    .line 190
    :cond_5
    :goto_6
    iget-object v0, v1, Lcom/yasirkula/unity/NativeCameraPictureFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeCameraMediaReceiver;

    if-eqz v0, :cond_7

    if-eqz v6, :cond_6

    .line 191
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    cmp-long v2, v2, v4

    if-lez v2, :cond_6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    :cond_6
    invoke-interface {v0, v7}, Lcom/yasirkula/unity/NativeCameraMediaReceiver;->OnMediaReceived(Ljava/lang/String;)V

    .line 193
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 13

    const-string v0, "_id"

    const-string v1, "Exception:"

    const-string v2, "Unity"

    .line 44
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 45
    iget-object p1, p0, Lcom/yasirkula/unity/NativeCameraPictureFragment;->mediaReceiver:Lcom/yasirkula/unity/NativeCameraMediaReceiver;

    if-nez p1, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    goto/16 :goto_3

    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v3, "UNCP_DEF_CAMERA"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    .line 50
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "UNCP_AUTHORITY"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 52
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v5

    const-string v6, "IMG_camera.jpg"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 55
    :try_start_0
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 57
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 58
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 69
    :cond_1
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/yasirkula/unity/NativeCameraPictureFragment;->fileTargetPath:Ljava/lang/String;

    const/4 v5, 0x0

    .line 76
    :try_start_1
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    sget-object v8, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v12, "_id DESC"

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 78
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 79
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/yasirkula/unity/NativeCameraPictureFragment;->lastImageId:I

    goto :goto_0

    :cond_2
    const v0, 0x7fffffff

    .line 81
    iput v0, p0, Lcom/yasirkula/unity/NativeCameraPictureFragment;->lastImageId:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz v5, :cond_3

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_0
    move-exception v0

    .line 85
    :try_start_2
    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v5, :cond_3

    .line 90
    :goto_1
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 93
    :cond_3
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 94
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v0, v3, v4}, Lcom/yasirkula/unity/NativeCameraUtils;->SetOutputUri(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;Ljava/io/File;)V

    const/4 v1, 0x1

    if-nez p1, :cond_4

    .line 97
    invoke-static {v0, v1}, Lcom/yasirkula/unity/NativeCameraUtils;->SetDefaultCamera(Landroid/content/Intent;Z)V

    goto :goto_2

    :cond_4
    if-ne p1, v1, :cond_5

    const/4 p1, 0x0

    .line 99
    invoke-static {v0, p1}, Lcom/yasirkula/unity/NativeCameraUtils;->SetDefaultCamera(Landroid/content/Intent;Z)V

    .line 101
    :cond_5
    :goto_2
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const/high16 v1, 0x10000

    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const v1, 0x87718

    if-lez p1, :cond_6

    .line 102
    invoke-virtual {p0, v0, v1}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_3

    :cond_6
    const-string p1, ""

    .line 104
    invoke-static {v0, p1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->startActivityForResult(Landroid/content/Intent;I)V

    :goto_3
    return-void

    :goto_4
    if-eqz v5, :cond_7

    .line 90
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    :cond_7
    throw p1

    :catch_1
    move-exception p1

    .line 63
    invoke-static {v2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 65
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPictureFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method
