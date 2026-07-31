Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBAF489865
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785536318; cv=none; b=NWRAmLHa9VyMDzWLDzuoQMs1QY39ZOk1r8kq4nO/I7x5ws8H/D2sd3Kn6E4a5jBsbjuz0gp78KsdHb6eyvmeTySTShW1+G17gqCjXzYYMF88hdWCNll8rsCMJJE0Uv5fc7igYlnHr8LUBAvBISgQViyb0HvUlm3QZ4IbNTaCS4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785536318; c=relaxed/simple;
	bh=agteeWmzM+kF99xjI2oWqvM/xRpVrp2hM0FjBwpIj9s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WjIPE3xPmShZhHV1R5VfE4O0MILtxAVPgs/chaDFa6KWfQkkZRy3ysJqFGSgQtZW35KhSnomnm1yNMTmFazvuMnAQEy0gVF0jU0aDYj62RCXIBWDzx+IQ84B92LTPW/QRJMbNu+ls4IqYFSOJ8S2I7GonAo6MV2A2TJ3Msk3OW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7ohCio7; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7ohCio7"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81ed073fed0so21946327b3.0
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785536316; x=1786141116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fn+/0u9SivieYVyZToaK0JcxBLpMkaVPj2mno+LIjIQ=;
        b=c7ohCio7/YsRvJhlEGWs2u1qA00dey5VKoL8s8L9597zQF/sDpwo3rwJ8JypJ61s5S
         NvYBkMavLLQivhEZ4w3bwzlTHmMIuLeDxATI7vapv5kCSfgubjBabLPvDoCijDXdcY6y
         dLMtkeB38wLzD4KHYXM/liU7dwJCtbZoCgdiPSSD3bcKPaq7DeFeLGWZkO929uOvaYPX
         GgX6AOdMd0kaX6lBu08AI/aQApNYEjnOb14j0UWt1PIRNTfILE2bpd0eWG1kT4fOKRjm
         bSmI39ZZ4RXs9BRgkUGDWD5njqv07BIYQh/sMso8e0A44FYh9QVTHYMhcfFJeb2TKLya
         FLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785536316; x=1786141116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fn+/0u9SivieYVyZToaK0JcxBLpMkaVPj2mno+LIjIQ=;
        b=YSKL0O5D7KA11YdzQGvTqdBh4mRPfw9F/uswcydJP5/VNTw720THTDWnobipKu4lob
         omlCcSXPV8wEiDwUHaEavdr0RQyxMcgatJqkbOUD9gBJodl6RbbPyK0y8S8fhl818icZ
         585682/F3FcEMzQkdJTzroP9DIG8Fd3rHvDOoDWPjmroZzvm2EAttvZ3axM8CZUlrXKo
         gAxXFm/BKXmWqkQl8cBBU/Pr0OJjMBWb3jimvsL+8DPsr5PjlXPLab5A4b+k7D++U5Oy
         09kcRGFN8WZr9vv+mQs1IyAFK/t0vl4rh9qVlBM6GGJSKEUm1pGrOJed6CJtvfIJ1or7
         9c+A==
X-Forwarded-Encrypted: i=1; AHgh+RqFWoAvPY1z9f3WINt1Lv8eeRr/eUtc21vKG3WUXscyVW+J9R7YiSWpex4gfhDqjvDvfXH+A8ESUprrdZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/MuePMKuh6q4k8U/laV9MiNj2HxR8eRNviba7mE4bixiNaBm
	ZBfX5AsJu3LJrJqLnB4/Vw8bjAvAZgsrWj5Fn35EgsaUtdBUJH41ioGc
X-Gm-Gg: AR+sD10a6dk8ZVT+2VNwIYk/Fg0U8/7ry4CQaTXx/NH+7NI+DAGY/LUSnGet50Ac1/f
	0bJO8m2aDCv7DhcaOHysKiWAvSoPZIaH7Rgdbtvx+RNuUpwxzeq5/7s5kF9BnvMjkGFxD5/Cn8v
	77hu5dONfS1iXJu7Z4lLZSS8ZTaB/SAU5tsJ547J9p0pkVO+xf1DTwFSSVNpKyvF8iX4TZ60uKn
	kiCF8BlV3ynwbm8irkUIbk5wCyHobH892BAImFxl78URmZzeo0IotgyTBbQWesGPe4yARgscobk
	bGMPHxirsI8j4wXnsf+l14eZwpsId0Tdw8FgeBekDHelZ3IzYaHFtB/SgYr8QxlMhx3GyHcnBVx
	LqYnt+Z7vDr+fVP605ZxgYPftdz5Y2vJEPTFGgjZmmOaGgznwhPCxnNpWtRj5VCAPI9UW1wXDi3
	7jCn/CfmWEzu/s4U/N/m0I47On8lsiuBZJEeEqm+EjxBBA+qlVcGzRF7izq40Fs6Ijqg==
X-Received: by 2002:a05:690c:630c:b0:81c:8dc5:29e4 with SMTP id 00721157ae682-81fd4c0d6ecmr21174597b3.32.1785536315836;
        Fri, 31 Jul 2026 15:18:35 -0700 (PDT)
Received: from Gentoo ([191.96.227.11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fd71a9033sm3794367b3.4.2026.07.31.15.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 15:18:34 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	unixbhaskar@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] usr: Correct a spelling by changing a letter
Date: Sat,  1 Aug 2026 03:42:11 +0530
Message-ID: <20260731221556.3638651-2-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/dit/did/

cc:rdunlap@infradead.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 V2 changes from V1:
 Subject line typo, thanks Randy to point out.

 usr/initramfs_data.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/initramfs_data.S b/usr/initramfs_data.S
index cd67edc38797..e92fb59b3fba 100644
--- a/usr/initramfs_data.S
+++ b/usr/initramfs_data.S
@@ -3,7 +3,7 @@
   initramfs_data includes the compressed binary that is the
   filesystem used for early user space.
   Note: Older versions of "as" (prior to binutils 2.11.90.0.23
-  released on 2001-07-14) dit not support .incbin.
+  released on 2001-07-14) did not support .incbin.
   If you are forced to use older binutils than that then the
   following trick can be applied to create the resulting binary:

--
2.54.0

