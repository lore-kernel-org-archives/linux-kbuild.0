Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E0A225775
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2026 00:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111403; cv=none; b=pdHPKNnie3GBUY/OvqJVaU3TYfFC2MxESgbDfavjL1XaMMylWrOP1RtMtMjRK5D/D0VK8YeLA7xy+vdoyc9YVZnnpmHKjDhA3qTI/xwFOGeqicCkhLgPSR5ymW9PqePZ3oDgsiMTIt+gYLK6RqlkMcSTFRC2aUCydFKrMZdiVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111403; c=relaxed/simple;
	bh=YZfh4lOFhIfDRifl19Rkforp38T4P7E5soEAMEdMEPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDa8LeVjMhKAZdGOaCQ6XXUrL0Jvd6VyVPgvnCt4QdShFyN9qtaVwY1WBtMlYSH353ZwESosQbf3BPrg3x/uXMDbnc4VWL1+/BlcwwBEy6FlaDLLDJ2yD0t9+QOFMa5eIJcCMj2qYlL/UOcacIJ5nX643mMnfRDzYH0rPYDiVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMvS46Ue; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMvS46Ue"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956869750eso15539405e9.2
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2026 17:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111400; x=1785716200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mF95jYXUiLPtf4O2Fy8j4aIn774igpRbGR6wn7JFZYs=;
        b=gMvS46UeGyx1ZFUFDBVX5dmaai8vLS1woWwpW/yLBU+Wr0pNsuADr+Op1XW0cFzZss
         xewRmcTm1F9AoYI/6RlSDlQxI9JlKOx0W2pyTnXMvqOWr6tK5bBYYSxGl3xb3Ni6bgzA
         SAA2W9nD+On2sANURx1wpjLux0O5H6quON2Het1ADuPGFVpK87Ape5AORzXmJY/5KqHG
         ylcH4zaGIl7MwHh/NYwPjEqb+lurj/yL9Zo6lbed8t6uPn002+kLeCyg6sg7yCgaOVZy
         zvOI4RfyG1XhX7mcr3VJCBQaeNGc4RZjPZ5P+8jkXd6qHm5ov0D7IhdO4+cnxYo36ELv
         lTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111400; x=1785716200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF95jYXUiLPtf4O2Fy8j4aIn774igpRbGR6wn7JFZYs=;
        b=OAB3f77oaMJHc+rKNB1U06xYin6yMWtsVT2/8mKEIbTx5SLfzjlYoQgrZu57yCcYTA
         6LeHMOpohoR/0uPXOZDmQ2qeTWG12kNqI8btW5l+IsSZLgWtminwPlcG4GT/WWBLNfCC
         XWuY7MtvjogfHUED7RdyqpUeVSN80nLdsE8ACSWp4P9NkZS9l7gGHWAx83yat2QqPCbM
         2ldkCj2fRGbuGp3bDfYp48cS6CoISnUpHMdhyGDRjL0I8AwkRCbHltoG7XZgHC5Qgk8C
         VCmuUts68eeeM4jtB2CbRlAfjhJaYKq7mwxDsDfAW74ONzmtmnqNUWt0gKAxLu9GuY4v
         kWWg==
X-Forwarded-Encrypted: i=1; AHgh+RoSexqss+nAkzBg3cr8lDLpHvZCjqtzemAjD3r3GeD4zsDp5Kz74rRJ/OnvOYzkfPV6C++b0c8Ll8fG5RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc6ypVndjE34VpKvQse6hNGcVlhGiYf/RuitnTZ23neIYb3/EO
	4ZLZLD7Vg9SomtPfabnrGCvsuaJ7mIUM4dd/wLuhW0KqIrMsg20lpCOq
X-Gm-Gg: AR+sD10wbD0JAT1+6q4JkC3jYWbb/i/X+cyOddx3PC8XZF/S9hemy8FvanURpp136Gv
	MY0SHnS43/TZTx1k3PQPUvzaqhDDUAPEdncnmLLDZP3GSsopjnvilzmtf2briEY2fIzpRza4dIo
	UCbIRdcScam8F+ilrffzWi/AzgQILPKjfnZYxF353L37BLTEuanjR6AT2KAlVk+6/rUey5OUqP3
	HkKs15B9mn9f+Zkw/iHl4Df5xucy9nkqDKsU1QOpqMY+QLiB08boucPPSETCkp8E3l4h8oGq/HG
	9aNsYh/f5DdHrxcFovpPu/fYg7qAk/u8DBoaPDVpncDdwDucXQ8L3s5ddmofbIUXBmb5bvZl9Yq
	nMXB5sqNi5wYncLSW0wi6N7Prhows/1mIHTmTYOGQarEPkJr2+gfv6V72uK6c5YcqXfFKMcelkW
	U4YHIyZTR8D5QM5Pb2Gq8QBP/mxq1f1guc61u9yhvabp/4RWFodO/CPg8dpvE86GteqA==
X-Received: by 2002:a05:600c:4ec8:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-496b56f3705mr84130915e9.9.1785111400175;
        Sun, 26 Jul 2026 17:16:40 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485f65csm176403555e9.5.2026.07.26.17.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:16:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	akpm@linux-foundation.org,
	jani.nikula@linux.intel.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ljs@kernel.org,
	andrew.jones@linux.dev,
	masahiroy@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 5/5] MAINTAINERS: add entry for kconfirm
Date: Mon, 27 Jul 2026 01:16:23 +0100
Message-ID: <20260727001623.2794156-6-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727001623.2794156-1-julianbraha@gmail.com>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I will maintain all files introduced with kconfirm.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3c01eecfa2..c7066ccef6c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14041,6 +14041,13 @@ F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/
 
+KCONFIRM AND KCONFIG BINDINGS [RUST]
+M:	Julian Braha <julianbraha@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kconfirm.rst
+F:	scripts/kconfig/kconfig.rs
+F:	scripts/kconfig/kconfirm/
+
 KCORE
 M:	Omar Sandoval <osandov@osandov.com>
 L:	linux-debuggers@vger.kernel.org
-- 
2.54.0

