Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332137;
	b=niy2y3INwddskDnAXODHvB3XT9pV1ROkQkW8XX2xG6Ap2rTYlxeHH1Fd+zX8zawSHO30
	 n7Rzi+/L6sNArDXTx3/1gVvLlS49juR8kN9Vkppyp2mdxwxuFSQBwVuu2gmixpmjsEBJB
	 wJJxVQ9AUu3PI+gguzxrY9LW8yb2rqVRLFJYonjsfQVl6gNm+UIoij98ACo9roZ/D1DPE
	 Y89mf+0M1Gh749bCMW8K6r3eXjjnhhW/Vt7B5hBGmpXIqxer6+xsl9vNhtM99ylsx8mQ3
	 EYZEDoWYT2Ip+BZuHt+uOJ09vtR/VGWaiHWHsnBDFfLRTtybdZEWADnOx9k/A8j1d9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
	b=xJymRtV00g/GqSP/RwpnuQ9joFvlIsAisgfr3hNagrQy6arMuv8r3vzTwESgs5i2kmp0
	 G+ZhAm82CFe/5l+QyYfRMVhki9qfJdHfsyuz4Rv++8f3yQQnTwlQtZLouSrpxlvIi6Lbg
	 q4pgAsZc4GgHfaosCRIP25HiPVpgqQX0xP+IrjKuCa747ZfPjcblIRXnpwLSA86sBoLZR
	 AqvdFbOB/nxJELDrQZH/FPbLS9XGjteOyEZLaaWqAoDLm8bKwP1aGhNhA6uegl3bdAAj2
	 Wb57t/wjcoFtvejPUwZ5Zz0m60V2hA7aKvedeDKZot0aDQ5P09xwq0kOXz0bZmEJhog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlfYej7;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0060A2620
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 17:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A0060A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlfYej7
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so21393905e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 09:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332135; x=1794936935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
        b=aUlfYej77ygzmzcD1XknZ8Xa1J++Uv47fItDW84lx4AY49JfBMzyc2G6y75h1qFrGE
         Lv+JKxk4oNbdBT49Mezge9HBuGF5cJZuDRgqN/+rWMjrxaqBL7+1HjgOsMeGjkwR+W5B
         qgW5kVMlj9rUsmV0dTdvR4HS776XaIMmEP08OGplU+iX3fd55MiuYp1bEHZfHU1bl8q5
         EFYJoy20+HdKc1iUv+OJ9aKlQ9XhsQZGoYtclAeg+wsDp6kP387asDvDnw9/0Rro+2dL
         cDsnv2Ho0sh/BOcXxdI57h88hVGN4G2mcXqqSD+PWO14JqORz7V6Ku605f5il31tHiwB
         7ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332135; x=1794936935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APfnAnRfqIF1xPyNGMocBkilW/E9MxmNCL7YBJA273g=;
        b=CilGIkJIauhi74ih/EXDde8dsbUpl5Dq4GxzQ/Sk72TvXVB9s+Kp5FEsfgh+4EWYVj
         rLjBH6PAHAn4+hv8gb0RN88Ch1f0ahgrilbkpW6Q2/7umYmwinEE1ePxdkIa/UOFiopQ
         pxwyGsF3LcsN+ar4Ft5G894zSgPFeUBCY7/YU4di4J5a0JLxm3j1W8CMXKPi4u52kY3q
         6tcC574adozyOxeQSLZaCCwX9WrhLsyv3Qe8MXv5634wsnnvJ+W2JhRxvKuWwBBxko+o
         44p81Fh3L9hKXU3VoZU6yePzIIwE8XxcVB+VyNC/JNxT7jICM3HK5PTXmZIj6HRJti/7
         RawQ==
X-Forwarded-Encrypted: i=1; AL+hErENHCqrWbX+S2JafVBAGvDF3UgXhs6BjWQxWEbsJ0Cqn90QO5aH72dFy4goOPhRIeY/uS3vTAPq9bgL8qI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BfOCmo7lF/V0oobp7NTzNIUfk5XWoUiiAyIb5G5pjZVCKGWCP
	9qBFBJ/hR/sOEObRdk3MvxLcApoSsSHwJqoRBCniGkuke3F7VMXExmXD
X-Gm-Gg: AYBFou26NU0ztVqmH/FuSXOJyQKw+XY/Pcy3JSCaleI7ql9WXYX+baSX+Le8AfpNdiS
	FUPAfCfy6HZROIjp43fuvfY5HAaTMlBasjlFzxxyt2jIC74We5hAAYA5aGf8krQaU+AAk6gUpXg
	jP6tmu0s63LBpnmlSw3vKUHbFg50vQdmS1C4NiPw+SkuGMMGJr+Ag2gu52LR+0SSfmIxRxUjgFJ
	eWi9wMvIaBSh+6K9qfmZ7qcbZDfvILrJDlBVvaGvLJFAGZ8TUDjN1BXiQz0GKTnEXfWGZvBfuvj
	AR9NP65FJe28Aqjpho7tlINhXxXJvzUpdNgiE8R76F1LD3H3AKAaAn2WUoAWHWpo/PTNTTaEHC0
	6/9205npUyITObvaHmsZYd9wN/evhTdXc5O6F1YjWFSHVVYxcqBpD9oorrTlyMflrLCBI6TJ3XH
	RYoAN1gFl6juNFZAOMW8Uu2YrIIahp+iR0FLZjOwmKp+jcRiuVe6qPGIV76t6gyQBkFIK+rYQWt
	iWb9CP28qSl0J+QKCiDff8Wlj2Ar22cymAcWYkQb/aN8Wou/U2QX9ByLmaWQX/r0woJN9T84Gyh
	l+l3qfyP8URH+czilCRssHDK+4xsM2kDvwv7nn71jqMJ8EOaPF4r6NhajijDNznDDwbPSJjgdG4
	7WpP1HLtBuWxZWYqg1A==
X-Received: by 2002:a05:600c:1d1a:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4ba08db09ebmr1603255e9.3.1794332135087;
        Tue, 10 Nov 2026 09:35:35 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6445687f8f.50.2026.11.10.09.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:34 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	jakub.git@horky.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 3/3] kconfig: show continuation at the end of wrapped lines
Date: Tue, 10 Nov 2026 17:35:26 +0000
Message-ID: <20261110173526.1548434-4-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110173526.1548434-1-julianbraha@gmail.com>
References: <20261110173526.1548434-1-julianbraha@gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a visible continuation '\' to the end of each wrapped line.
This is because some line wraps are not otherwise obvious to the reader,
for example if a line ends with a symbol name instead of an operator.
(Below example uses an 80-column terminal)

Here, it would be less obvious without '\' (GPIO_TQMX86):
    Depends on: GPIOLIB [=y] && (MFD_TQMX86 [=y] || COMPILE_TEST [=y]) \  
                && HAS_IOPORT_MAP [=y]

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/expr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 0b3f2d7bc809..a539b617b62f 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1167,12 +1167,15 @@ static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *s
 		if (sym_str && sym->type != S_UNKNOWN)
 			extra_length += 4 + strlen(sym_str);
 
+		extra_length += strlen(" \\");
 		last_line_length = strlen(last_cr ? last_cr + 1 : gs->s);
 
 		if (last_line_length > gs->indent + prefix_len &&
 		    last_line_length + extra_length > gs->max_width) {
 			gs->s[gs->wrap_pos] = '\0';
-			str_printf(gs, "\n%*s", gs->indent, "");
+			if (gs->s[gs->wrap_pos - 1] != ' ')
+				str_append(gs, " ");
+			str_printf(gs, "\\\n%*s", gs->indent, "");
 			while (prefix_len--)
 				str_append(gs, "!");
 			if (!sym)
-- 
2.56.0

