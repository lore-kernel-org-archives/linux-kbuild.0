Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6149A3CD
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2026 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539188; cv=none; b=AyHgjNlblRT/HlfJLSitm/UjPat5yp85UGyHnOjv8ZvSKP/4HmzTNppc7E7cZBH+hCHo/gJSZtRr5bIgQ7ecDjvsxw3INic5dwcFZgDp8hdkPzQj1RBwgwYSfB5uTdZ5yUd87QpLue7whY+qItbKTZ0Nw61sCYLFHL+pymQ4+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539188; c=relaxed/simple;
	bh=RAJQnKkDBXdd5vQ/P+np194z6Ot3PXYd2Bw3RnHlVSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W17365Iv1XuH/8Ld3Auyc7/NGis9vBueUPf0GF+fyKjLxj1v1LDW2yLN8kzc+JHOXCK2ovW3KH5JTbXwFik1elrOLYLHupLjNDzSMWCZUl0SBjqMN8fTbV6ATW3kh3rFgBsMmBhAqouHEM93XZ1ye0hxCLv5YxzljTFP9GKkJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfpnW1d1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfpnW1d1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af27fe287so2920474f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2026 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539181; x=1792143981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdjcKesxfT3Y1JRnD0eSSSUTshq47A90dMPNUITOibc=;
        b=OfpnW1d1makdUJB4XeJQfm7B+XJknyWmFqynfa6dtaiH1xURMxMxWXENP8548ANVdm
         7kkdBhqHRqOTkmPtKTUbixXEQkMGZ6fjxaZO3exJiF9JHOPJPMeeHJIXxwRjcG06Erkh
         wYKibK54hN1kbJCqx1xTFDRf/o3BbstNERrJYUMs9dM9lfw3LzXrbjd2YkXeqR4AnMOf
         7XBMPx7XAONsTTnCWaZ/Bmz90yzKNRb4GBuLighXt+YdB3PW3fv0N6NzqlT/RMim00fD
         Kvqca1xtXhVHVpjlXAeP1Gbxp9TfrA0/5MCCBhCX4Bh3rqhPPXv8UsrauM7+WXeBQRCs
         6ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539181; x=1792143981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdjcKesxfT3Y1JRnD0eSSSUTshq47A90dMPNUITOibc=;
        b=tWsm37ierP4Fit6lD3Uf8EueL5gBF14rBI9iWiowH114gi8GOje+nHXjLsnpHyS7Om
         xcW6BlqcralZEQyvgoRnQZnvXAzxtj8UHmyJF7xHybt00vn6SX0llbJr8PxWZlJmNWVo
         kyO5pOJxdK+ziPC3WOG9cEnI2Di+9xq8YVc4JVdActHwyyx+5vSVMaiqGA/VajpXzXne
         qRzg5E/6fNKMfvJi+kXO85Wr09ua3vI5xXGCfHwS3fXp83RGyC+8wH1Hi2Gp0bxpwFzd
         LZ92n3i6811Mp+/BsIDWTxYDJXws0bRH19lhfzVC7FwHeHao+c0JVIaiCorfRPI/Q7Mt
         0vQg==
X-Gm-Message-State: AFq9FYLzha5UNwOnVJ1kq/Eaj+QGHd7vjRKK0+eoELSx7at6fFszE2oZ
	jfO+5me69Zn0y/EzCC5hsyPl/RDLZ6WkLunqePYsgeExTCfMfQIwqccX
X-Gm-Gg: AYBFou3vJrq1WN9NcyLoJEzVIedoTkHk3y8WaeDeavjgN5nWzZqIPFTBbzSZa5aRN3K
	i1KJ6vq+QrMZ6JGOe1YVPj4cjmcca3xNUs3hM8sl0eID0Jo3Eq4TgfbE+LVmFnBkFuF85UY0aE8
	P0Wfb4aN5eTgsLcNUXo14M4Z2f26jth/riY0xvrR3MEILExtQXfwRu+Xh/O6Dq9OS/J7iH62zaH
	OY89XwKXBp+IDU4yh/Hf81MqNcbsP88OjNGo/ZFoHEIqoWgKBj4IfR0hssOxYkzyv+rr1WqyV8W
	8zXz6JdgaUYJ8RoiADoPLacgujx1iBNsZm1dpblhODdnoAAfkdvjDr9ng3Zwx5LSnKdFqgrGi4i
	Zaf5ainTTRNmwPkObuFtgzhKWUeA3ShuK/aOgqmh/OgYb2dKjf/zbTLKf5ogsFmOGt7qqHez+/Y
	50MBI4S+lFSCAqbBk3goy7QnDlu0DLznjQeM06SeE06D8PDlIr0pOP+gjiLauhhCUghF6mQJdM4
	+xG60xHZVpmc14JQd733kGU1/ufkH3GBvoF2zQgyEhIYMUdLokoBg==
X-Received: by 2002:a05:6000:1ace:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-48dba9dacf6mr2801939f8f.19.1791539180541;
        Fri, 09 Oct 2026 02:46:20 -0700 (PDT)
Received: from nixos-office (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adeacdsm3051833f8f.55.2026.10.09.02.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:46:20 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: kconfig: cleanup stale comment about 'keys' array
Date: Fri,  9 Oct 2026 10:46:17 +0100
Message-ID: <20261009094617.17322-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'keys' was removed from 'dialog_textbox' in:
commit e14f1242a8be ("kconfig: menuconfig: simplify global jump key assignment")
but the comment referencing it was never removed.

Let's cleanup this stale comment.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/lxdialog/textbox.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/lxdialog/textbox.c
index 0abaf635978f..3fe7682fc8a8 100644
--- a/scripts/kconfig/lxdialog/textbox.c
+++ b/scripts/kconfig/lxdialog/textbox.c
@@ -145,8 +145,6 @@ static void refresh_text_box(WINDOW *dialog, WINDOW *box, int boxh, int boxw,
 
 /*
  * Display text from a file in a dialog box.
- *
- * keys is a null-terminated array
  */
 int dialog_textbox(const char *title, const char *tbuf, int initial_height,
 		   int initial_width, int *_vscroll, int *_hscroll,
-- 
2.55.0

