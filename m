Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A358124D
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202909; cv=none; b=kyEnLMIynela+1l4KaROlKWmqHHBs7tNAbeD8KpfZXe0L3V8FMb6ZnxvBziQDlLvZUzRWXqBSTg3/jLZYIvbaCJru/5uZKW0PXFOZUddeSDhvhT8+XtQ/6TU/ixmJL2T/mUhHpIaJtBm+0ykF26PBQO8GZqTiAlx1TrQ+P513sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202909; c=relaxed/simple;
	bh=xMZm/oO0FtfekjkxZIUS9OIoDKqTmliEkK4gwpH/mIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMjRiW4AYNydtGGynbPvo32vGAeYzoaxTvi2st12D+GLdZz4qs7nOtUHjQ+LgH1i5RrmvUCFtFj7euRG3M42ytHU16U3yWQ7onGCVSPA2TGAiCjWdGwEUMF6FA+ILwoFCBifl8QVxX5jsbHzeGdsqFsN2kTPA+/56W6my/DPiJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI0fU55R; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI0fU55R"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6bc475ffcf6so811914eaf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 15:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202904; x=1790807704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2eu41/ydt/uEYD6twBRH38ATPyPlKojYjlAenMFyI8=;
        b=JI0fU55RBdVYpr07k41wn/NA1ITWriNoDA28p82Qqh2wAAp+34EK2zXNi/MV03utuC
         nInAiERehmxNJgDrUg47FJ5eAgzBF5MLzZmmY5hfkD8OjkBHVTnYMIOMrJfBB1d0amU6
         QEYll8p5z2sIHeffh9MQfln41SyA68FBlTAdkjdexErArA9+y9bCglQH0EKpQqAtnr7F
         bvyRoePVUwXkwk/+Dob7XsYqnezIGqkji+CxTgdtXN0+Il/1ZK3yxCvPTjgBqE5DCAi+
         ycTt0cfHA94Z6DLrVK2hSPGLkVGFcpeVW9ECtjUDhwh1W6qGKjrLn8hOFa5tBsB9kzfY
         USMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202904; x=1790807704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2eu41/ydt/uEYD6twBRH38ATPyPlKojYjlAenMFyI8=;
        b=zqXPlmikgf37RB8vgFMCrudvvfrR2d2VxDIhHh/CmJ2Tzm3wwfo1XhdGBr8VRthzv2
         W9KbPVuoqQM66iB9ehRavjfcVD+tvYjzU9SpQKTKH8a+cEKSjQBxMFjNTbUyjtsEOubU
         vbLt+1/6bjqCny6rFoImbwP7tw9b7yT24TWHYemFjvDtilnp9WjbmjvOuqRP1Hd/zWxd
         3yqbD+/BS9FPynz44JK21O1vlZoFXVvP2KBibEjHH7B0QW9BcXqQJ5M34P0TwAmkMXQG
         bC/3rKDCdxRGRczIGzjYs+GuPErF76tmlQ9D2RBP9aOgtq8jGfocifUKPPEoZv6rvf3p
         11NQ==
X-Forwarded-Encrypted: i=1; AKwUvBwe92NCpfdsFsKbNtvWLSHiWUWcTkhQ8NJBieFsmBTN0u8ygrDGbN/3IwBaFQ/CBFLRd9TTS92sa/O7qN4=@vger.kernel.org
X-Gm-Message-State: AFuF++lTnr0JgJ5Bum/1k7MxDMvypCSTWX5Zu7pJeJEDgX2jP5/3Rw97
	IqOxpfMM31WtW5JFnxCagwbn0mMijJGEaAc2791a/ZMWFw/BLYX43I7I
X-Gm-Gg: AYBFou3IZp5RjtSLubHV4z87/9a8e7oZrt0yOHUj0Iwmq6sa3kQEsEsGFgr7HGfKYqN
	5WOAx7RT7YMMSeV1rGImLVg3NR7YUF9n5Li0GcU2/nrO9TBtw0y5h2j0HXsf+zQoI6uJBoIs6rN
	1RcGYmlKbUXp4UO9atoW/O2XZpj8PBDQHDRmgYFT27dGHaP1UKA6fIoJ11U55lRPWpB0k/9kNfo
	lSbdsItSE0d8x0rYYKyw842aWY4N1AOr6CmvST+UEqJb0PCTkFVKF6xngl4s4OHdnbee0QcwDDu
	M+G7JgAalGhiQSme/OopYtpUgCrc4DASx0aywwKuMqhUZuFSbWlDXvOKMQ031F2LgXDuQVeLBRt
	oBXaEEKLUTRrRWhku5+wXXuMOzScMLWG60WmEEx4i3RFIHIgAXUi0n1HB5ek4juPA/WaNtxg7ek
	cKymimqrs0NFgl7tCUQsXlNsTXJXb/zkRvNAsap5UA/oD6usVSmxhas6/IauNdflnumTtRWxMwj
	OhvUFQgomn15KICgIc3qX6xcwPPUlsC6cz2NNDUuoGz4535yD/YbToXBoOqGCz/VgV7vpH/fdkr
	zw0jcXPiJdS4iAqTeeY=
X-Received: by 2002:a05:6820:3090:b0:6c9:80d9:5e9 with SMTP id 006d021491bc7-6d4410d8263mr670241eaf.42.1790202903465;
        Wed, 23 Sep 2026 15:35:03 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:35:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:35 -0600
Subject: [PATCH v11 11/38] dyndbg: drop NUM_TYPE_ARGS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-11-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=1542;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=xMZm/oO0FtfekjkxZIUS9OIoDKqTmliEkK4gwpH/mIw=;
 b=Vfs3Matpzo3SccOlI8tHyei1RBD+zxWT7bK0muNastsFT501W8UwskuCT5d6UkNx7lTaofuTx
 osWKhGB+d2uDdbEIEynMyQnEsO2jTiildSPH6fRj2j31Ia/oBayQeVB
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

ARRAY_SIZE almost works here, since array decl is complete.
But define it locally, named __DDEBUG_ARRAY_SIZE, to avoid
include conflicts with  boot/<something> on some arch.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v7: actually use macro
v5: drop include, it causes redefined probs in /boot/* for some arch.
v2: include linux/array_size.h, correct commit subject, review after sob
---
 include/linux/dynamic_debug.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9607121c3072..baf5c0853f45 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -8,6 +8,8 @@
 
 #include <linux/build_bug.h>
 
+#define __DDEBUG_ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+
 /*
  * An instance of this structure is created in a special
  * ELF section at every dynamic debug callsite.  At runtime,
@@ -122,11 +124,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
 		.class_names = _var##_classnames,			\
+		.length = __DDEBUG_ARRAY_SIZE(_var##_classnames),	\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);

-- 
2.55.0

