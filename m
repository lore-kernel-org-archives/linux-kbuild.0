Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7E62F260C
	for <linux-kbuild@vger.kernel.org>; Sun, 13 Sep 2026 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311285; cv=pass; b=czthTW/9xgXqCFZTAkqbp8od1IwkOkMYM3uQHz+B5zUwL36+DAc1hvd2EJy/J7uYzyvBg0hnCLwoIMGtl4VUYm/qn1iz5Ueq1RF+PER3ZynZKE5K1tR6FtAc7koH/iGHGQXAt4hMQHE9NIgzMV/tRLZxhnse79hzlb1dsuj0OGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311285; c=relaxed/simple;
	bh=5o+exoV/LDdiHzW9lCUaclIoJhNHlTzMl+ffFgN8f6k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BIZ+3EH10n8VRL44SjlWfTmumQykH5T/9DU0bDhLjef+VDPN7Bih1HS82Y3MjlUttX/SNa68GURYOPH/hjSrzyfTcuk5CR8VWW8i0/p4iS+cGjnh0nuyyHEybvr8iSnNh8ndhq9av02txFwuicaECPwD2W/nmo3lCeFI2/WlBlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4PHrWlh; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4PHrWlh"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aae3149so852086d50.2
        for <linux-kbuild@vger.kernel.org>; Sun, 13 Sep 2026 07:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789311283; cv=none;
        d=google.com; s=arc-20260327;
        b=MLYny4MKTQ6gR11Q6eQCFkRwK2iEQDmd1IiDOdbFfzwn+YjEZ6q2MRzMIfXab5SNCX
         WrndrV9ZM2acYiatiG/SCrTXek4UXt0qgmmdbHz30813ibmVE7bTFnIgDDOqXQtNdeOV
         Cd94mwwvlD4AAENP7JI2wtguJZfnQAqq32CfVwkMaS3fhX2o909rSQX/Kl0l4cjfwZG2
         ztdVaaK5GjXW77ENtUVX4vYHTN2hZDyu6ZrI6minr+FkUq8n3jQaqnVLILKpjUsv0V81
         ZiiX/S1Xg873b3zVax9jA4XV2OPUhrUXJs5UoSCvwsftWBXRY3byU4Ktz5mi4vEf0HUG
         FasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5o+exoV/LDdiHzW9lCUaclIoJhNHlTzMl+ffFgN8f6k=;
        fh=N4qg6fAzraURl6HDkP8jjoOZkzi175rl6mBs+1IpnzA=;
        b=X440pzdb/ZnBnJDZeLmnqTE8hY0hLOOvI0uMbEwVbOFNxMm89H73JKqceNL+7gpxuC
         ilKCRue/z3Wvfl4q9ZZZwxEUJyNgcQAFmu/3iKfuLhXE6kJyFh2yUd+vwgD8uO2E3w3M
         Bkhvgzx6hPiwyKVWeSJjjls0fSEDFxSbflgrGzRGBD1WkfS0NZUjrsvqgXeC9hp6jxZI
         9gh3L8JOiXetMPu+tfTIap0EoDtH/rLI3BRHkB5TlW3gyVzs244Jpg311wz/gsAb0LDW
         lrkRkW0u/JA2qwlGh9GR+W/KTAyeslt9icLkpoA8/3nSxb6uLqTOtkzZAyEHlsBE7k7U
         SLew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311283; x=1789916083; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5o+exoV/LDdiHzW9lCUaclIoJhNHlTzMl+ffFgN8f6k=;
        b=K4PHrWlhphlBHTSYC3JNDORbI13NPBrcIUL6wsvCvQKjIhq+cDZra862eT1MVH4BDn
         CkyHn+XH4isJGpKfGDhYp9FsDgrBfcsxngQUm1WKPrg+eM/TR7LkRW8/pOuwQvNMnneK
         Q9q3w2Y1XqtQevwMjCtGE3clFRVgCioqUyrI16rE6NnBqXKc1r2f4uFmCeWUYoYd491a
         J2xKk67TDtNLnn/zMTJRk4jDWUF8y7TgBLUDGBqr16MhMUDdTjfMb0Z9DWJf9pYno4Nl
         shk7Y7gDqHLWWHHw7Tyc3c+SE1W4zdLjwBiYIUVFYxro+4E9UqT3k2e2353+nbnURQQ4
         RG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311283; x=1789916083;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5o+exoV/LDdiHzW9lCUaclIoJhNHlTzMl+ffFgN8f6k=;
        b=qpWrVghr/G/377X6jH1m/fjSZIqmzCrJu01LNJMsb7uU4Nm45Wlg8A8IplWAYOp3oP
         +wwytGvDVlbzKVDGX3V3sgPAzzsrLQ3Fu5mdcGi0tqgyCKVK+qDHdjdmVv/wOw51+mJ0
         YlhIc7QtmScF6E6xkK439Ddn/sGcVIPx/y6/C65ERB4yyYN40FDsHpY4BSBJoGhNT+AS
         /kV/vnQs/I9G0lF4443Jrm5bpPRNm+IKwulngKEBWRJZdzR6TV2HBI5FPtV2EmxSjvvb
         Ay3Ec6EsANOz+x+qAclmF7o5pDbqD1COzDV3oG0zncSHplT/EQGv3ezj8NxvKn+W8ScX
         h6OQ==
X-Gm-Message-State: AFuF++kNXdgmZSyQLuqcLds87aKS6o0/b4auB3yeSGIsHPp2ygvenvYZ
	ZHCbc1Khj330IqjDRFGMbaPGU3wKve5cb23AlJlRb/EQSNwGaxR9ZsZudhyoiLmAXZ+SfBdntii
	1gjkocoY+dfM2n5eh0lKsp1IdUeNXUJQr/mYc
X-Gm-Gg: AYBFou18Z7JWSO1rXETKcX7fnFc6WtMaN9sjQMFN92AvWXniICdGzX6bBoAXtczU3lA
	wd0O2BU7n5Rbd62oEjrWbSOcTZEBFL0jeAFJ8RgoQO6yaOsIuU5gWm02I8wuIyUrA4iMd4lPzCV
	mzcbyAXogb1r7Lq5RmQSF7Q8H8LST2n6dArjTNrxsKcsI2E2Zbz4bvRfi2dZXVdGNr2erUSCxA2
	NM6p82lo1TfpS3g6++nR6sHxaVVCOJk56kvwtvdEx4ctCFrIbI1LJjZzGcbPDz52YNobpgYsUcX
	DkHz5jluM32AYJORre1SLRPZnHmZIBUw28ZSFiDXzffcn4615Flv9w3i
X-Received: by 2002:a53:b989:0:b0:671:22e5:ec1c with SMTP id
 956f58d0204a3-67124775701mr3936368d50.46.1789311283066; Sun, 13 Sep 2026
 07:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Im7CK <computergod47@gmail.com>
Date: Sun, 13 Sep 2026 20:24:32 +0530
X-Gm-Features: AcwNN1X5XdRy-zyfSEKG5z0aU46Jb-e2EgTxUnKIdnK8A5TQjvj2H_0q-nZHpBA
Message-ID: <CACgbi99eSJRx-q5yZR3cMheDaDxKKpExg_fkzapbM8B9YuSh6Q@mail.gmail.com>
Subject: [PATCH] kbuild: fix grammar in output Makefile .gitignore generation comment
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fixed grammar in the comment describing the generation of the output
Makefile and .gitignore file.

Signed-off-by: Mebecool1 <computergod47@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 66654fa71..13236b460 100644
--- a/Makefile
+++ b/Makefile
@@ -681,8 +681,8 @@ ifdef building_out_of_srctree
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
-# At the same time when output Makefile generated, generate .gitignore to
-# ignore whole output directory
+# At the same time as the output Makefile is generated, generate .gitignore to
+# ignore the whole output directory.
