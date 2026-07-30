Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC742CCB9
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420104; cv=none; b=KOErB+uV9+0H5m18bP7cOeOtDeUOhP7bevXOLuGcjPpFSw3Hndx2RKDDqeiaNjwkJt7ENlpbjqzRmc9CgBlIBjuUAoy2gfG0BvRnVvmUjXDVPeg3+RapMK+k4hwhMFtxeo3YfJAnl7wvCqsonanct3+PiibrMuVrKW3ig8etHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420104; c=relaxed/simple;
	bh=ri9MLwB0DvTFmAF7fuhBZmWK0NcRSRkk+obgkZ9ss54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMaWfWMUFoZUafQBT6JRAIko8wczan6Qk+z+Rayw4qpAIlrYdMXM5ZQD/M/hoiC+AynP15MBMCnBlvFkKzZRIjUTRYOjyOkMIiP5+ECzQU1OZPytwUVnadSw85MoTY/IqJ+yxsCRm5586Jv0jQH8rPFOwIPnJ20QyQSjjCjKIlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQIEka0u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQIEka0u"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954aff6088so19795785e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785420101; x=1786024901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MM+a2ReeoFL4RNqETaQgicGycDtbnrFeItVUphw4i3o=;
        b=FQIEka0ut0coGrT4W3F7Xd0zzFJuiHQUQm7Rp7ESw9XFbheEHLUWmKxz2I77k/BvTa
         hpwP1Je4c6yVSt5YFY0pX4zv8GCQQooTHk6Sg8gQfOSkC/Itikr4bQwzd8v/748uwb74
         2qrrZ0dcUp2xUOEe/1j3x051Ggljgylh20aseRHjobaSQQ1VlfWAq02JYBmQ6hWnNXeK
         2Tp2OULGYk7/YOi8lwlaPFzY5NYPRGAg+BG/EPM6aTEZRPyFsgJDzYlnvafBkfCkwlIG
         UdcZXqxiygn8Ehd3NKEnf1vrCVLGmq7xOgXB0oCNML8NABp9iMnXC82gYT08TDTGGOaj
         ZIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420101; x=1786024901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM+a2ReeoFL4RNqETaQgicGycDtbnrFeItVUphw4i3o=;
        b=mMtNNoOvAobO6JSBy+7PmJGEyE7LjG8w23ZZpiAsHWY9dUCUnqUI6m7bJaTPpUp0rZ
         Tledee+jXKV89ctKSDeeDbRn9uP2UPgIrIVl+0VePOIhYQtANX6l1243xkUJAOzT+4+U
         nrKflQonGofAM27ETuSnEQPBJfZYVOhXz9/1hqe/TrP0f7v6BcXwTDhki440aEhlF5cb
         wnOz3lkOLVNAHujJ9XCKEwRI6fD9VYFxALqIDRVUQqDrKQlGMIDxQcAKRtsQ1PwO2LL4
         yQdaz51dSXRIVtYtecdVdfUg+8AtzosKyz3KxT0lAakOMX/B7DBFv80NE6IW3U+jgpHs
         y8cg==
X-Forwarded-Encrypted: i=1; AHgh+Rrjzuh/YNHwNtrbM3deoTGRhz9jVhsKYLFs1YeQBuzEj4KVRzd0PxW6q0/5plQkeVhcAG0pLrp6U3WdWDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVQoTUh+pSRrzPZyXpqtiEsffpfFfCoQSGm8Byl37zpWBAtsPM
	S4VzHNQMIChCGosVjnqRwmCWKdZTLVsi+jycKI9+mDQxM6l+RA2p2Ht1
X-Gm-Gg: AR+sD11KnBHnvgno5V45aHeKFXp/L62c4xrlK5wHTWaecHGyqhifMOrcIai26Z8zh69
	DTY1PhtdpGV+zMrNt/wZsCBSkBCVS9HM+SM7ICFVbLtx3VQsuSJVG9oSUhpqkRdKn7R4V6VfvrN
	3faK6l/11CEMjSLHs38ANXLjFKxKgQ1FRWH6HL/NvYFS2h/MB/7O3ZYiQPfbRRgqKkmYycvwbnl
	WTPuRUIU6qLivCkYDzZhvPinp/oVP8VIqQOnpj4PAD+B59FLmpW8V2njr9WHRs7M9wbGN/qmEfv
	mxrnJldSNlOQ7wKbBqPy+PpGySVSxRYHRkmmNOR8KyofIF4KteGINsr8IGU/PnPoWfeCuW6g5FU
	qz+UgK6wc6pCjHDS+ldAL3ZHYsdTdxDAkLfVJMqgc7Icb2tsIifgSr5wS6WYhCkdzCB+7k8UQi+
	XwqhkToVhEfcD596ccEY9KGl6yqD1P7aVQ/Aw5FIhBakTBeaEj6QFBYoVY4fwQJSpp0E6nDFAbq
	XQ+1TJg8qMS9l+JB2q7tjbzBqFETKL2khyQzjvhTB/14fWPz3hL
X-Received: by 2002:a05:600c:e557:10b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-49800ea21a6mr25943175e9.20.1785420100866;
        Thu, 30 Jul 2026 07:01:40 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f1a91fsm58238575e9.6.2026.07.30.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:01:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: jani.nikula@linux.intel.com,
	arnd@arndb.de,
	stefan.hengelein@fau.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	nico@fluxnic.net,
	officialnaumansabir@gmail.com,
	rdunlap@infradead.org,
	vegard.nossum@oracle.com,
	kees@kernel.org,
	tj@kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] Documentation: warn against using int, hex, string options as expressions in Kconfig
Date: Thu, 30 Jul 2026 15:01:08 +0100
Message-ID: <20260730140108.683967-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've been working on type checking Kconfig, and found some instances of
dead code due to conditions that always evaluate to false.

For example:

config FOO
  int

config BAR
  bool
  default 'y' if FOO

This 'if FOO' will always be false, regardless of FOO's value (even when
FOO=1). The same goes for strings and hex.

See also this related patch:
https://lore.kernel.org/all/20260729210546.394392-1-julianbraha@gmail.com/

Let's warn users against this usage.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/kbuild/kconfig-language.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index ab2822d7ca1c..aee84b294a56 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -320,6 +320,17 @@ An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
 respectively for calculations). A menu entry becomes visible when its
 expression evaluates to 'm' or 'y'.
 
+Note that options of int, hex, or string type should not be used directly
+as expressions; these will always evaluate to 'n'. Instead, to check if
+one of these options is in use, consider using one of these heuristics::
+
+  <symbol> != 0
+  <symbol> != 0x0
+  <symbol> != ""
+
+because int, hex, and string options will take these values of '0', '0x0',
+and the empty string, respectively, when the dependencies are unmet.
+
 There are two types of symbols: constant and non-constant symbols.
 Non-constant symbols are the most common ones and are defined with the
 'config' statement. Non-constant symbols consist entirely of alphanumeric
-- 
2.55.0

