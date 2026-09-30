Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686B457E78
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755135; cv=pass; b=RePMVobmTpHm4VgOwvjS3VlmylN1QfxjUw1p9xzbbAlBum0CO/y/YNa8km3jNlWy5t87fIrXr460S/khEba1+9+gvsStK15EAc6RAFJLkXCe6AUiW4MwexWZPEpU0H6Wcudzf8yWC6sLKDVJsqtnNUm1zrtok+nizSCqrQg/GUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755135; c=relaxed/simple;
	bh=GQ67D7m6aGzZahEWTzQMkof7xobtH+TCj5JbR+ns31I=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7Z6j1SwA0wOPdRuBzikMqvReSCD6y50NXkVhhDxtq+vwXt4oPfFhkcxUh1TE8h5b0zOKQcKyDeOT95lGVfguns2nkboenKZ0vcNO0iyd/KfijMm/DsS2ipCijuRpkWrg+5gFMKJYzcy7q3cIFhK/sgFcM8TSSTdOK0nwzgjDC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YT/tLQt5; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YT/tLQt5"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93c56f7c1c8so500820985a.3
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 00:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790755133; cv=none;
        d=google.com; s=arc-20260327;
        b=RTcJPX6K/BtaloHjhl/omCjXKucFiM9905x+Ppytg+itLApqzeyAS2y3QywrZDB5oP
         hUIPth8aYgncncuTyeSm4FJGlkY+sFYSI19O9gXmDG0GX9gfdj0NwwUTWDk7Ohkm0Hyo
         SCBSHoc+gLLZY7MUqZ5dHJayCmXcsj9BwnogICyPGG3V9X6P1JVAWC6mMBiD1FUr8yJm
         tTIcIppeoWeZQ9/aF04edjszWDcSpy31F+Xm4wKzFWQCynpccIM7F/xoMvuP8QHF1diq
         LKRSfFjc3/usZH5Nj/cvWML10uh0qkpOUEzR7YZhJ8TMRKdlz/wm68t0Mjd9dgt+4TfS
         y/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        fh=aXqqRGZyTR1k8vwZ9syfJAhe6fYdq6N7pf7vcYbHSag=;
        b=U7CuyL5S+HS/ibFsS9zb4ZpI5qdrF9UNALC/SU+liEAEH/to+3MJZiGRvu31Qsvcgv
         hiDZWq6q8nxFA/tkNddnqXIJIeT9gMTIB8Oc+z8ih4P5iZPB/PgF4HLZCO7XncHFDO/I
         ygxkWCPPO2EOrACXXHLCsEKu+TvdlzRgHOQdaR5E1zwpRyg4LpaBsjO7O53N9y0in+cN
         HeqEUtWzEPSBbnAVpHNpRrSo0A2ml5FgD7QNruDL4/U4CHoE12RierCcz0YLzFiwGLDy
         N4U9w3jfjEBgq+8tlnxDibxcy+1neA4E4sFWSnKxP7ZA7g6C+5UUmtVESq0uGb0qUkfU
         e8Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790755133; x=1791359933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        b=YT/tLQt5toXIXl3oN0qdQ+RNrUKmGXfNh6jPUxBKmxbYkmwuxdMfhjVwcFktK9hs3F
         aNxZ8biXmtceJOgS1jZDaalcVgLM6TNs0IiLX8Vct8xi/ekOfVMOAHXssUrN/fx2ngb/
         pEpOE9zLELnXGBw5cE71nsaAuCcZ5ygOnp09ck2dqQySH9f/u+1DIdxXjVUE/iu9qVdb
         umQKos7aYuiX4EEaukshKtozCT7NvC5It4F8NEfx+3vchAQj64Cm+IZop4xyngDdug0Y
         oK4u6JovLfiWvD/54TMzZ9q+qw/7Qt60NmP3UBJeKrzpCMpCg7rEZF6sZ+m++kfQVW5f
         qWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755133; x=1791359933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        b=uURbShmRLHS1sQhL2hgnkxF7wjNUL/PK+pRkFoC+gyrFI0SE3YEa2jgul46Y3xdHz6
         xz26GAAv0NIvWv+vhbQMRXzMfzh4UAYGYIgHCgU3Fl/7m+q8gBqUF8qktEFgyEkPIBf4
         HClcPc1wPQ/x5OXuqJBATG1AG+bnBrxCd+vAAAT0s6I3PfL40p6xqEdTgP5SwYiMGROv
         yhjHwqeKZFlUntVom1vDxaz2JjpuV4QqK6EZQU+MwjeTMHQv/PSCuxLSIFMlwMxJaMBl
         cYPvW2Fqe3+rDwSG9UNLbxy13gxEyJTgNfX1xjDmftpkroLXZ+gBgFpJfMBLoaaZZPcX
         XOLA==
X-Forwarded-Encrypted: i=1; AKwUvByPF9MQa+IHxlDUZA7nciPINu6Gq84iC0b7lRHlDywFLLhzaaYM6/Ft/6Qzqvn3RUme6steZvxbXdB+Zbs=@vger.kernel.org
X-Gm-Message-State: AFuF++n41yPHZeWoUsxBpDm+koEP3aQm3HRA3LIv4fAXGYuWh60tuPtB
	n6NsWkk2exxX99hsMUGh9ZYMsuqcRqLT4vb/AJh1JxLarzDlewoY/PzpotZh8jvRjSkUHx5cljK
	/VwbkHsHKPgrDOw/qW3varoEel/zo/ab7IGb8
X-Gm-Gg: AYBFou1usghtiErWv/LBdYwBKLkFqY8UcUgRjnIW2FHbTkMpalhznsKWMya0y8qP0pA
	O1hpQEW0O6bDoWe3P9OywL9htAnb2VQBnEB1fo7ERx7Mpioaw81TABpo9Oc2Q7aOOhxcpYnhnEw
	Pdt0lso+XrzTlRUseh584lOj2uhEo3F9ELo7mzSlgm8rQvqG8qwprbD/qq5njOiB13AM6Dxnyv8
	mvBICeaeegd8ObmoLOhlDYrfnnQma3xYZnS4w8/tlmb7LX++uDE6TsCGw619Ws3v7Ok/l8eGOt4
	lR9UNdupuNt2RC1AfFp/ovttlh+f/KldP+EkzFqbfOUsO59WSfJgZnm10KakQWeVH+cEtoIGfDe
	D98bGaJKKMiQ1oEOkPkrcXtpO8oH1sJ2Eal3LFL1vsclaytzHyVW4Gil0kZ465rmwf1occCRUf0
	8Embd672RDGWRdCJmnET+1cAF0KSP5oS+gjm+XmWevZ/w8P5yw2ONQNT38PESZ82xfk0tpiDLj8
	y2/Qu4T2po80sw=
X-Received: by 2002:a05:620a:454b:b0:939:b099:d52f with SMTP id
 af79cd13be357-93ca9650a87mr80148785a.20.1790755132822; Wed, 30 Sep 2026
 00:58:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 00:58:52 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 00:58:52 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ting-Han Hou <ue081723@gmail.com>
In-Reply-To: <179071199261.2735405.15944114878466249879.b4-reply@b4>
References: <179017337986.52388.7943687183785012868@gmail.com>
 <179037565553.3985470.12035061965740287126.b4-reply@b4> <CA+NtrhRdnuZOOFpBXvnfOXFs-HA8q+2sLvR0BxH=BjzVAEZBzw@mail.gmail.com>
 <179071199261.2735405.15944114878466249879.b4-reply@b4>
Date: Wed, 30 Sep 2026 00:58:52 -0700
X-Gm-Features: AclHuK_l14BgBlQAEUqwBjjdsg8HswhmB8XtP7bRP6Z064JojK65_GlLOUveE00
Message-ID: <CA+NtrhQeOacYz+nGqevB778YW01sREPyndzh6QOsKxQR3ON6RA@mail.gmail.com>
Subject: Re: [PATCH] clang-tools: Import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Ting-Han Hou <ue081723@gmail.com>
Date: Sat, 26 Sep 2026 08:52:24 +0800
Subject: [PATCH] clang-tools: Import os for broken pipe handling

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Hi Nathan,

Sorry about the formatting issue. The diff header was wrapped in my
previous email. Here is the corrected patch; the code change is
unchanged.

Thanks,
Ting-Han

 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py
b/scripts/clang-tools/run-clang-tools.py
index e78be82..79d58b3 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys


base-commit: fe2ec83746e501645709761605c2464a44fd2929
--=20
2.52.0.windows.1


On Tue, 29 Sep 2026 21:59:52 +0200, Nathan Chancellor <nathan@kernel.org> w=
rote:
> On 2026-09-26 08:52 +0800, 14=E4=BE=AF=E5=BB=B7=E7=BF=B0 wrote:
> > From: Ting-Han Hou <ue081723@gmail.com>
> >
> > The BrokenPipeError handler in run-clang-tools.py calls os.open() and
> > os.dup2() without importing os. If this handler is reached, it raises
> > NameError instead of redirecting stdout and exiting with status 1.
> >
> > Import os so the handler can work as intended.
> >
> > Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python script=
s")
> > Assisted-by: LLM
> > Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
> > ---
> >  scripts/clang-tools/run-clang-tools.py | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/clang-tools/run-clang-tools.py
> > b/scripts/clang-tools/run-clang-tools.py
>
> Your patch is mangled, so it cannot be applied (maybe you send it with a
> different client from your v1?). Please resend properly.
>
> --
> Cheers,
> Nathan
