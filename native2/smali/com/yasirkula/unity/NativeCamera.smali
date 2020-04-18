.class public Lcom/yasirkula/unity/NativeCamera;
.super Ljava/lang/Object;
.source "NativeCamera.java"


# static fields
.field public static KeepGalleryReferences:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static CanAccessCamera(Landroid/content/Context;Lcom/yasirkula/unity/NativeCameraMediaReceiver;)Z
    .locals 5

    .line 126
    invoke-static {p0}, Lcom/yasirkula/unity/NativeCamera;->HasCamera(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, ""

    const-string v3, "Unity"

    if-nez v0, :cond_0

    const-string p0, "Device has no registered cameras!"

    .line 128
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-interface {p1, v2}, Lcom/yasirkula/unity/NativeCameraMediaReceiver;->OnMediaReceived(Ljava/lang/String;)V

    return v1

    .line 134
    :cond_0
    invoke-static {p0}, Lcom/yasirkula/unity/NativeCamera;->CheckPermission(Landroid/content/Context;)I

    move-result v0

    const/4 v4, 0x1

    if-eq v0, v4, :cond_1

    const-string p0, "Can\'t access camera, permission denied!"

    .line 136
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    invoke-interface {p1, v2}, Lcom/yasirkula/unity/NativeCameraMediaReceiver;->OnMediaReceived(Ljava/lang/String;)V

    return v1

    .line 142
    :cond_1
    invoke-static {p0}, Lcom/yasirkula/unity/NativeCameraUtils;->GetAuthority(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_2

    const-string p0, "Can\'t find ContentProvider, camera is inaccessible!"

    .line 144
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-interface {p1, v2}, Lcom/yasirkula/unity/NativeCameraMediaReceiver;->OnMediaReceived(Ljava/lang/String;)V

    return v1

    :cond_2
    return v4
.end method

.method public static CheckPermission(Landroid/content/Context;)I
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 78
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x17

    if-ge v0, v2, :cond_0

    return v1

    :cond_0
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 81
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_4

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 82
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const-string v0, "android.permission.CAMERA"

    .line 86
    invoke-static {p0, v0}, Lcom/yasirkula/unity/NativeCameraUtils;->IsPermissionDefinedInManifest(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 87
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    :cond_3
    :goto_0
    return v1

    :cond_4
    :goto_1
    return v2
.end method

.method public static GetImageProperties(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 116
    invoke-static {p0, p1}, Lcom/yasirkula/unity/NativeCameraUtils;->GetImageProperties(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static GetVideoProperties(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 121
    invoke-static {p0, p1}, Lcom/yasirkula/unity/NativeCameraUtils;->GetVideoProperties(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static HasCamera(Landroid/content/Context;)Z
    .locals 1

    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "android.hardware.camera"

    .line 27
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "android.hardware.camera.front"

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static LoadImageAtPath(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 111
    invoke-static {p0, p1, p2, p3}, Lcom/yasirkula/unity/NativeCameraUtils;->LoadImageAtPath(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static OpenSettings(Landroid/content/Context;)V
    .locals 3

    .line 66
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "package"

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 68
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    .line 69
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 70
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 72
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static RecordVideo(Landroid/content/Context;Lcom/yasirkula/unity/NativeCameraMediaReceiver;IIIJ)V
    .locals 2

    .line 47
    invoke-static {p0, p1}, Lcom/yasirkula/unity/NativeCamera;->CanAccessCamera(Landroid/content/Context;Lcom/yasirkula/unity/NativeCameraMediaReceiver;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 50
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "UNCV_DEF_CAMERA"

    .line 51
    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 52
    invoke-static {p0}, Lcom/yasirkula/unity/NativeCameraUtils;->GetAuthority(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "UNCV_AUTHORITY"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "UNCV_QUALITY"

    .line 53
    invoke-virtual {v0, p2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "UNCV_DURATION"

    .line 54
    invoke-virtual {v0, p2, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "UNCV_SIZE"

    .line 55
    invoke-virtual {v0, p2, p5, p6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 57
    new-instance p2, Lcom/yasirkula/unity/NativeCameraVideoFragment;

    invoke-direct {p2, p1}, Lcom/yasirkula/unity/NativeCameraVideoFragment;-><init>(Lcom/yasirkula/unity/NativeCameraMediaReceiver;)V

    .line 58
    invoke-virtual {p2, v0}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 60
    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public static RequestPermission(Landroid/content/Context;Lcom/yasirkula/unity/NativeCameraPermissionReceiver;I)V
    .locals 2

    .line 93
    invoke-static {p0}, Lcom/yasirkula/unity/NativeCamera;->CheckPermission(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 95
    invoke-interface {p1, v1}, Lcom/yasirkula/unity/NativeCameraPermissionReceiver;->OnPermissionResult(I)V

    return-void

    :cond_0
    const/4 v0, 0x0

    if-nez p2, :cond_1

    .line 101
    invoke-interface {p1, v0}, Lcom/yasirkula/unity/NativeCameraPermissionReceiver;->OnPermissionResult(I)V

    return-void

    .line 105
    :cond_1
    new-instance p2, Lcom/yasirkula/unity/NativeCameraPermissionFragment;

    invoke-direct {p2, p1}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;-><init>(Lcom/yasirkula/unity/NativeCameraPermissionReceiver;)V

    .line 106
    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p0

    invoke-virtual {p0, v0, p2}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public static TakePicture(Landroid/content/Context;Lcom/yasirkula/unity/NativeCameraMediaReceiver;I)V
    .locals 2

    .line 32
    invoke-static {p0, p1}, Lcom/yasirkula/unity/NativeCamera;->CanAccessCamera(Landroid/content/Context;Lcom/yasirkula/unity/NativeCameraMediaReceiver;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 35
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "UNCP_DEF_CAMERA"

    .line 36
    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 37
    invoke-static {p0}, Lcom/yasirkula/unity/NativeCameraUtils;->GetAuthority(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "UNCP_AUTHORITY"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    new-instance p2, Lcom/yasirkula/unity/NativeCameraPictureFragment;

    invoke-direct {p2, p1}, Lcom/yasirkula/unity/NativeCameraPictureFragment;-><init>(Lcom/yasirkula/unity/NativeCameraMediaReceiver;)V

    .line 40
    invoke-virtual {p2, v0}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 42
    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method
