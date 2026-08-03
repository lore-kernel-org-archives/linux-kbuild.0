Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA90F3BBFBA
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776927; cv=none; b=Q6uazH39HTP8OMzxE4ec8aBcCwLQ8/J2hRKSk2KHxCdinzFRW7zxpXPOpV94WdgEj0MJWqJKxSIcHcrYnAeXgFTF3oZxn0/f5KozDoVboy8QFOfV9qy2X1r0jYtWGXDv0HWPyb7lb0VE9j1ZwuqeAXsqrXPDLu7Z6Q4+CksfX9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776927; c=relaxed/simple;
	bh=81MWPbgRttoR+0d8yfKjqdwgj8cHpLV4Tc5BStoCbiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I7r6S+1+G7uFDnKip97AJSMAZ9C01Tqhsa2pNcey2+tMRZvVpB7ucuTo9R+gbEenjAFypwu/M1MNwnKZQw8SIXgAZEXCp2VFcY5kHbuCelNLNRjwIpIvocgSiYmg5j8qlOoyrl0qD5s9JlLNtU0sZ2ahZM1n9Vw6IFpoVJMgC4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ9IN3QD; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ9IN3QD"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81f36179dd5so50663507b3.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2026 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785776923; x=1786381723; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BQnuzNS1+o7a+6CuCUFIVOHjsICFrcaawp1nbYkmgiU=;
        b=cJ9IN3QDWJDIu+rl4meCObDAIXf1oZGlqJB2GMUyddHNem7+/P1rSCJnV7ywIHeEFQ
         ls6oUiM8XTUE3l68k+AkXhDGhdensJDZNwMj3zsH3bQO9GXpKCsS921N09Xo5tg3WMFH
         HSzjXh63Ta12Tmo5MDfP9p73TSlMWGpHFgdeJYbmB22P6/5as/uLIfbJiSgjZWbzWOrK
         S32XkAaGwZXiZmftw62akLHBolkezB43MrzaL0l0tEYCBhjXRbmv3neOZdGv82GXGvFM
         qwF8P9CarN0qFWuOCdpxe+wtZxxvglBNe9a4S8olbLFE2ee1WDlORF+lLWnKJeRlzZlm
         9Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785776924; x=1786381724;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQnuzNS1+o7a+6CuCUFIVOHjsICFrcaawp1nbYkmgiU=;
        b=iOQfgbnaa0QdoWhkl0YK44a6rcsS6qeE2hypga38jpkVsjcRmDQGz4APIZBj2p7oFi
         zZkpK5ERx8FRBbiyB2sKoFnWRVK/j/OQdzrVPxIwsQur0/VjTYDDJiHB8Nzeubu3SCSL
         IsCpD5UQBgeiCJp9jP1xLR7odk6Wv+rcwh4vhvi/W/cpHYn1YXyNh5HpSv0vxAv7A3QH
         VmCKLz71pGEh7EhThbO3+5dltOeUnLUFzZX6geYU/iNsBVYm4AKssO/7O/cW4GGeuw4t
         sU/KqVxRdFlvGN1MoDU4fSlXNWsJdlDXo+1u73b4l4/Aa2e29ZDRf++abbBnieRXhS2Q
         PPUw==
X-Forwarded-Encrypted: i=1; AHgh+Rol9A1DxLg0i3kz1AcPnk+3wip5IGvqX5o3D36mtLJ+ZPDXVZXd3XxelTx4a1DFY1DEjmVc1oZhXsn8HLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2SHkPrU2N4JJbs1cvKkVmca1Z0IXRKHTPBCZT1aQZYkVzVwcM
	k4B+xzh9J0WWbdbVZ2X8fHnwSOiP45hcEbR4mmCCxvwwLhln28RqDAZe
X-Gm-Gg: AR+sD1309igCh4kpHS6351suvMYe4dvmh4eO122xvofH3F2muTOIAdLXRskR8j9HxgY
	xdpc70t9lPQsH1WrbwoYXxlr7UsKxdAHpUsDVDY51B2bTiKFW2gE2q+zJmsU5KsTz7QaYC9fkA1
	nKY6fHslHUuYc6h9nVSEnCJc66XV9lgJ5p9MW0V2baRyG7tw8HRTJwU3oe+pE5ufOnnI2sDxtpK
	Ky8q/YVqZtP+4V9J2Hi2Lqz75+naLJ2L2nnWJjbhwi+KcieAPmn34WOf5kRmz8zFIioPeISKaae
	FA9n5hOYOoETR5Nkij6kj/Amsof+0kA0FEh9K9AU15mT52Ann97h2OT7i+lgx+YvXAPDC2Er511
	v08bOJWeCaTyo0lrj8AktUimbiWS0q0RoVuuVgoZZRaM/PU6XPXRgvr4bGRHFOHTYjBOkCmexH6
	ZKV89uBLsLSEnnU6QV5mcH1XTw5wtkm0WaoFSCkIs+/kJuHKyiYtF8bs30MdPd
X-Received: by 2002:a05:690c:6087:b0:81f:889c:2078 with SMTP id 00721157ae682-81fd49f2be7mr126767587b3.7.1785776923447;
        Mon, 03 Aug 2026 10:08:43 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd14658csm58796907b3.45.2026.08.03.10.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:08:42 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/2] alpha: enable building with clang
Date: Mon, 03 Aug 2026 13:08:40 -0400
Message-Id: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TlATkb4SHUy3XBAThQjEvycdh
 2GmQcVCWGGdGhR8qNKdBoh5AhdsupCRHwySS80NX5iNOVjm4nBMW+eFUngY7WAUueBJ73/b9t4
 /5aH0Ql0AAAA=
X-Change-ID: 20260803-alpha-clang-6acd144eb86c
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=81MWPbgRttoR+0d8yfKjqdwgj8cHpLV4Tc5BStoCbiU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIKTkv2xB08G3BGNvB3wKKIV5UPJmpLhfCV3otRE3QTO
 /pu7vZPHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPNEQtGhtNqv7yftT
 8TMuCZfPHp2r5rauVq4f7za//zm+mnLs5QqmNk+MnzNqy4YuHGD85HvB8IBl1boij6tvr1C+7/C
 StebAwJ4wQA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Two small patches to let the alpha kernel build with clang.

The first registers the clang target triple and stops passing -Wa,-mev6
when the compiler is not gcc.  That flag exists to keep gas from emulating
instructions it believes the target lacks; it is a gas-only option and
clang's integrated assembler does not emulate instructions, so it is not
needed there.

The second fixes two uses of local register-asm variables that clang does
not honor.  clang treats `register unsigned long x __asm__("$N")` as the
named register only where the variable appears as an inline-asm operand,
so reading one to get the live $gp or $sp yields an undefined value.
trap_init() passed that to PAL_wrkgp and load_PCB() stored it into the
PCB for swpctx, either of which wedges an early boot.

Note that the alpha backend is not in upstream LLVM.  It lives in

  https://github.com/alphalinux-org/llvm-project

and is a work in progress, so the scripts/Makefile.clang entry has no
effect with an upstream clang today.  I am sending this now because the
second patch is a real bug in its own right -- the register-asm reads are
only guaranteed to work by gcc's implementation, not by anything either
compiler documents -- but I understand if the kbuild side would rather
wait for the backend to land upstream.

---
Matt Turner (2):
      alpha: enable building with clang
      alpha: read $gp and $sp explicitly for clang

 arch/alpha/Makefile       | 8 +++++++-
 arch/alpha/kernel/traps.c | 4 +++-
 arch/alpha/mm/init.c      | 3 +--
 scripts/Makefile.clang    | 1 +
 4 files changed, 12 insertions(+), 4 deletions(-)
---
base-commit: 0e6be1d34ae92e2b0dbc1b7410d422b22464389a
change-id: 20260803-alpha-clang-6acd144eb86c

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

