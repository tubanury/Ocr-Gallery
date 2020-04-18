.class public Lcom/yasirkula/unity/NativeCameraPermissionFragment;
.super Landroid/app/Fragment;
.source "NativeCameraPermissionFragment.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation


# static fields
.field private static final PERMISSIONS_REQUEST_CODE:I = 0x1d745


# instance fields
.field private final permissionReceiver:Lcom/yasirkula/unity/NativeCameraPermissionReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->permissionReceiver:Lcom/yasirkula/unity/NativeCameraPermissionReceiver;

    return-void
.end method

.method public constructor <init>(Lcom/yasirkula/unity/NativeCameraPermissionReceiver;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->permissionReceiver:Lcom/yasirkula/unity/NativeCameraPermissionReceiver;

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 45
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 46
    iget-object p1, p0, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->permissionReceiver:Lcom/yasirkula/unity/NativeCameraPermissionReceiver;

    if-nez p1, :cond_0

    .line 47
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    goto :goto_1

    .line 51
    :cond_0
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string v0, "android.permission.CAMERA"

    invoke-static {p1, v0}, Lcom/yasirkula/unity/NativeCameraUtils;->IsPermissionDefinedInManifest(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    if-eqz p1, :cond_1

    .line 52
    filled-new-array {v2, v1, v0}, [Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 54
    :cond_1
    filled-new-array {v2, v1}, [Ljava/lang/String;

    move-result-object p1

    :goto_0
    const v0, 0x1d745

    .line 56
    invoke-virtual {p0, p1, v0}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->requestPermissions([Ljava/lang/String;I)V

    :goto_1
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 6

    const v0, 0x1d745

    if-eq p1, v0, :cond_0

    return-void

    .line 66
    :cond_0
    iget-object p1, p0, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->permissionReceiver:Lcom/yasirkula/unity/NativeCameraPermissionReceiver;

    const-string v0, "Unity"

    if-nez p1, :cond_1

    const-string p1, "Fragment data got reset while asking permissions!"

    .line 68
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    return-void

    .line 78
    :cond_1
    array-length p1, p2

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz p1, :cond_6

    array-length p1, p3

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 p1, 0x1

    move v3, p1

    move p1, v2

    .line 82
    :goto_0
    array-length v4, p2

    if-ge p1, v4, :cond_5

    array-length v4, p3

    if-ge p1, v4, :cond_5

    .line 84
    aget v4, p3, p1

    const/4 v5, -0x1

    if-ne v4, v5, :cond_4

    .line 86
    aget-object v3, p2, p1

    invoke-virtual {p0, v3}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    move v1, v2

    goto :goto_1

    :cond_3
    move v3, v1

    :cond_4
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_5
    move v1, v3

    .line 97
    :cond_6
    :goto_1
    iget-object p1, p0, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->permissionReceiver:Lcom/yasirkula/unity/NativeCameraPermissionReceiver;

    invoke-interface {p1, v1}, Lcom/yasirkula/unity/NativeCameraPermissionReceiver;->OnPermissionResult(I)V

    .line 98
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    .line 105
    :try_start_0
    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 p2, 0x20000

    .line 106
    invoke-virtual {p1, p2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 107
    invoke-virtual {p0}, Lcom/yasirkula/unity/NativeCameraPermissionFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p2, p1, v2}, Landroid/app/Activity;->startActivityIfNeeded(Landroid/content/Intent;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    const-string p2, "Exception (resume):"

    .line 111
    invoke-static {v0, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    return-void
.end method
