Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5303A4511
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776882627; cv=pass; b=m7t734ME0NyekbuP7lKpTA7Tr1y8mfViMLqF3VqBNUeKwQiyfgOGlhX5uLoTe4dIlJ5Ce30aJYpfIb8qFew3U4Fz6yPjNinmWY7nJSkMf3hc6Bw0dyO/dWX7fBkFgK2Dq2kJwR0BR2frCf1KuEWgrrg9ATBG0PLjVFpCxAqFIJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776882627; c=relaxed/simple;
	bh=brFxvU4IGxAK8GOm2f9zW61WD0Rnnc69BRJA89xIkm4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kwZ6Ai9jzIOZLHMjNDyIRBalZdJGyp9xsjp65wV6dx6xsd19VFt5JyhCoa+tkYO2+bga8lfyGGNzEyOFTBbRUMazmDQpr+tlHTrU7GwWzn61as2a3+3srj2y7fLb3JfylHvemyl/uKVSSZLmuV8cs2flwjV53/NFGuBJs5A4VBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeeHKV8n; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeeHKV8n"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba6b39871a3so621475966b.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2026 11:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776882625; cv=none;
        d=google.com; s=arc-20240605;
        b=F5vOZPXqJh4aPccetKcxM7ffJLJun+HCgTyuhHlRqGqJ3RZOyA6SWkfJHKf7QcAomt
         TPWMIcdpp4+JRoocvRgXyVgZULWQyLY2nGS0Vq69hjmXNOilgBGlJ8eGdlG4c8L5jqQg
         SVPNueJac1S4DdIXmTwAtZfUDoeI7/kb2EAQkura7PXS8VTu/9hoGwBPMnKFW9k6Ha2I
         kIgcXiXYFoL7xvTXGaRunLAiCvT36R+J3zXBckYxNbLizapDmPmroP1G3tnEvWoJvY21
         RriKLtHnAaPD3pFhm8sE9AXmI/UN6i5YhYCgcGtXDncrK1D1lex8dJwVHgjGBARWqWop
         RTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ODjxza3t7xSvwwhG4TtHB183PsdDEfUIQcK2rH+NfOs=;
        fh=yTH0h7X9/K8FnF4eIep9pU4hXWkkXgaz2ZUi2Bs9ecs=;
        b=QHWzM1+Qcm/u87nf+kCgmdnrxlrwx/f+nHqfuh2UPqNMd4gHXnktqtsRDhU0jU7E6B
         pvOxiXcVsk1tBLMAgI+iAkozKKuXPUTah1lrBvnE3WwbJB6/HQDMd3cu+pFE9T+BqGAW
         QQCEDiHZhNWfRwz9jvblWARIBjTs9s192emFbzhwQpsrlExROhbMBIVaFf22b/dkSS6e
         XWVjHqBf/6tT+IeOLqfWjhene3l5DW18E6VoojBudU30BgmmfF8cDJX9+QYsG8jn+5S1
         FItR/a/OFFrCOf5N+nt27Jd0VI6uV9H6P0siikIZL/XD/z2HSpnGwJRdGVZPL3/KtWYe
         3l+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776882625; x=1777487425; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ODjxza3t7xSvwwhG4TtHB183PsdDEfUIQcK2rH+NfOs=;
        b=HeeHKV8nZbt8nz2Eh0BjpL5XrsYjwwPEDYK8e4rn/s4PNvQj+qUlf5DraZ0LY/i1jK
         iUgyT4uKyCxNix1SCfpGd1940ls3vZBCRRGiQRueXSmU9wUyfEmlsWZjj1VcYMUwGHeN
         bBLPtVg2+6GzDHTXqbkQtLcFPvOCyWQHz4pQbbVNDMMsgZr2WiU40nzBvToreOQZx2Cr
         dzSZSMZ+3mKSjZE3tCx0wNw7jSLAYn26D8df1GbwJFNXxGeynRbTziIVnFGqmXwe/vO9
         Vu5DTJ4gSGWUrjdeRlE10A94v7dENkVLy47Uz3VHf3TgQj/BUpbIp5AEjrfdTReWs0Jw
         gb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882625; x=1777487425;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODjxza3t7xSvwwhG4TtHB183PsdDEfUIQcK2rH+NfOs=;
        b=RNXo4QZ4emsXxKLwC502jD7B8tpgNMyM7FERZhPLVqMyz+pBTX2LlpJyMYK3dqBwoN
         G8WUKg+5SjRrdf0O2TjCikEU5DzKCNn9IlXxkNRWAPrqElA/n2Vsnk0m3UMaA+ABf5xZ
         f8yFjv/qxEwymL/dc2lgHlU8AOfpqS0rWaHgu7DcpD7nCLz4Q5Sy9NtK4grt29y2kV5P
         O5+3Gb60sOmFKi2WCoMapQyUrmULGsC85YO78EGRRiP9deU4Wu5go59O0tN5FeSbULx9
         SYdfR3D263GSbAMigZTi85rD+6p82abtWZnEcWnEzRSpX99HN1Y+6lRcX/8xJmcts/2w
         ByhA==
X-Gm-Message-State: AOJu0YyYaSNO9CX4IjarZtrMrL25KM8MT5VUajpI/zQFYZR7cUgjNYXg
	haydOBI7kt9zA6hrTEI8e0vahTwQKAhYdo32RtlZur4nRqTaKWkhHrJ8ydnb4ihkFP9ekXsPdUy
	z9Mjkm/W96YAi1uEko/ZDg4UBETs/Je4=
X-Gm-Gg: AeBDiesqFd83Ok9kLWp5BhYHzR1j0/yPoc+yxCv8DUQriF5AdQuhBKPNwVEXSUw0TOR
	DO2kX+mY+mIyUaN+jzKpNl+YC4w1Zd8Lq2elQzmRdJr+50rH7qiHU6HF4+tFF0rf9vex0oZMuxZ
	1rXqNFN6H0o1P/HuthoTfryd0i4sYFhci449iprvXneL/McO/n66O1riHnE875RILs45hecjEe9
	eD9eSrGuPQyWrU6op7gPyvi9Pu/4VT6lvReJrme9Ah5SK4hpIPs0F6jZqyBXS6k+IVBf2T3rzlL
	bjv9ZbtbKAT0GJiJRb/h8TJrmUixz5kbc0VyVY+sO+A3IueBEp4YuFO7AxFh8N4=
X-Received: by 2002:a17:907:968f:b0:ba6:4eea:c1e1 with SMTP id
 a640c23a62f3a-ba64eeaca99mr830428266b.17.1776882624536; Wed, 22 Apr 2026
 11:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jill Ravaliya <jillravaliya@gmail.com>
Date: Thu, 23 Apr 2026 00:00:12 +0530
X-Gm-Features: AQROBzA02brXfbwemie5ZnZL5rzDR1hYjl5c-92v8lbdHzytNkerNa402Cmh-PA
Message-ID: <CAHr0PbumU-Y4G9rmuffd3crfOpqgxvQii0cVEYFC_sdjjNEZRw@mail.gmail.com>
Subject: [PATCH] kbuild: deb-pkg: propagate hook script failures in builddeb
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"

From 1d7c7d8bf70c3d2b2abbb5ead3c654978ead419a Mon Sep 17 00:00:00 2001
From: jillravaliya <jillravaliya@gmail.com>
Date: Wed, 22 Apr 2026 23:37:39 +0530
Subject: [PATCH] kbuild: deb-pkg: propagate hook script failures in builddeb

The 'builddeb' script generates maintainer scripts for Debian-based
distributions. Currently, it invokes post-installation hooks via
run-parts but unconditionally exits with code 0. This masks failures
from downstream hooks (e.g., initramfs generation or DKMS).

On systems with modular storage drivers (CONFIG_BLK_DEV_NVME=m), an
unnoticed failure in an early hook can prevent the initrd from being
correctly updated. This results in a successful package installation
exit code despite a broken boot configuration, leading to a
'VFS: unknown-block(0,0)' panic on reboot.

This patch ensures that failures in 'run-parts' are correctly
propagated, allowing the package manager to abort the installation
upon hook failure.

Signed-off-by: jillravaliya <jillravaliya@gmail.com>
Link: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/2141741
---
 scripts/package/builddeb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3627ca227..6ea768f08 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -98,7 +98,12 @@ install_maint_scripts () {
  hookdirs="\$hookdirs \$dir/${script}.d"
  done
  hookdirs="\${hookdirs# }"
- test -n "\$hookdirs" && run-parts --arg="${KERNELRELEASE}"
--arg="/${installed_image_path}" \$hookdirs
+ if [ -n "\$hookdirs" ]; then
+                    if ! run-parts --arg="\${KERNELRELEASE}"
--arg="/\${installed_image_path}" \$hookdirs; then
+                         echo "E: Post-install hooks failed." >&2
+                         exit 1
+                    fi
+                fi
  exit 0
  EOF
  chmod 755 "${pdir}/DEBIAN/${script}"
-- 
2.51.1
