Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404478;
	b=v768SQb7G06OiHVAu082gbV9SH/xe1HDjR9enfBEvhkIR3yWIX2QnEmZ8bH5li5gZ1Vo
	 WNEpbQoZwdRtoGSLGUrt57YmtEAtLtPE6fG3zSnuh6gd0oNNRPWdDQ6zxAm2tiJ7mqitE
	 OtSTIo7GWF2CaaRA+aTV5BT4HZJO+BCHzz+1IX291MxLcudhmn7zSCaINfbaumENDnI3x
	 Juk3X5djIeXv9MvULB+FuICkfZBsfCZEES2RAoFlh3kun12F/QB7WZQ6OpVdzV8DUGjLl
	 sb3/3lrXuIdxmww5BYw8+INAWytfJ9yCQPO765oN53QF/0t2Gb2rt+fO8s9wjqxKyVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404478;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Wf6GC0pos7NagAI8bEw9egY7U0gPHI7FXFb0Thd1+L0=;
	b=u3VcrEyx4BgUp4sMCaegN/Bp9+KsNVWCb/U4zXHakL6xkX/S5d1vUVKsL99b51+xvu0+
	 2xqPO1flBlWQDHsGb+dHNus7BL4HzVfEjNpY3BuO+EM05ZUa2aUMOKOr0XpjRb6D5D2gF
	 S9hmiaOqZYwuWXr6GUX52O8rU/zZ45vROMLs0RbkW7f/UiUBxYeYdyR3dv8yHxFIZ5b/v
	 YC7B7/Xdntcjqy75V8DXqdlztG5ukMSkXtJrQX40Ez280B3/mUj7qjnf3k9tFy35bp0Wv
	 11MvFOq8P8oA/llji0ovzirwBIV40CWskGqF38ETbOztv5CYKg3566E/OA7LvubnW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPoEitQX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CBE606A31C;
	Wed, 11 Nov 2026 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPoEitQX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2121D1F00A05;
	Wed, 11 Nov 2026 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404478;
	bh=Wf6GC0pos7NagAI8bEw9egY7U0gPHI7FXFb0Thd1+L0=;
	h=From:Subject:Date:To:Cc;
	b=BPoEitQXjGmdN5KW2c0UNs8lVzZgLqtiUG62LOacpVojt9wHT47QNOAEaFgmxQuOT
	 LcZQV1Rmpa0SFXblA/pTGc32JglFfvU8aiKyEumqd3dS9/eS3lIfW14vZDYpWHzIjU
	 YV0wTPf1ps+1mvFgAGcu0Igov5ACwHbDb15HJKk4fHmJcekamygvulndI/Zzl6sIW1
	 1zT29CX5JpyNoCgNfPIDQyLF+fv0whc3CXkgUiMdPCuQM8N0QKtdgCRelmn3I3VZrY
	 rPmuUvk/31ofqvBaA2u4g98M9Ej4T/X8jOFCN//B3+T9MpEIf4Jh1nEMUPw2IdvHzx
	 td5j2mqW8Pl2w==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH 0/3] kbuild: reduce single-build dependencies
Date: Wed, 11 Nov 2026 14:41:02 +0100
Message-Id: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N3QqCQBBGX0XmuiGVWshXCS9099OmdLX9CUF89
 zZtboYDH+es5OEEnqpsJYePeJlsguKUkX40tgeLSUxlXqoiHTuYqMFebD+A2yiDYYMZ1sDqZOK
 bUuqiuvLa5JqSZnboZNkT9/pgH9sndPh5/wuHd0ztcMyobTxYT+Moocpee+R8PLZYAtXb9gW6p
 ZDJugAAAA==
X-Change-ID: 20261111-reduce-single-build-dependencies-966646f25a0c
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=ayFwgbyzCc4jEX+AV8iN6VwSnjdMzA1UPAmivFUt1tc=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFlfCirKvuuFvvz37cRqRikucUmpqQLHnibsj/fY2f3Yj
 +HZ7c7mjoksDGJcDJZiiizLyjm5FToKvcMO/bWEmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 gQwdIwYuTgGY6ohdjAxTH/g0Km0yO39w09UoZq9t0Sp7MhbuMlfgnqe5woRFVMCFkeGa+fWV+U/
 mC83zaIltYly2d9ZWt+1iP/b6JgXsWsv+uYgbAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

Building a single .o file depends on the prepare target which contains a
lot of dependencies. Some of those preparation dependencies are not
needed for a single .o build.

This is a small annoyance because a modification of the compilation
flags causes several prepare dependencies to rebuild. Consequently,
single-build incurs an artificial penalty.

Move the generic preparation checks and scripts/mod out of the
single-build preparation path. The first patch is a preparation change
to make rq-offsets-file an explicit prepare dependency. The second
addresses missing-syscalls check and atomic-checks. The third and last
patch addresses scripts/mod.

== Illustration ==

These are the build steps triggered when changing the compilation
flags (here: adding W=1).

Before this series...

  $ time make W=1 init/main.o
    CC      scripts/mod/empty.o
    MKELF   scripts/mod/elfconfig.h
    HOSTCC  scripts/mod/modpost.o
    CC      scripts/mod/devicetable-offsets.s
    HOSTCC  scripts/mod/file2alias.o
    HOSTCC  scripts/mod/sumversion.o
    HOSTCC  scripts/mod/symsearch.o
    HOSTLD  scripts/mod/modpost
    CC      kernel/bounds.s
    CC      arch/x86/kernel/asm-offsets.s
    CC      kernel/sched/rq-offsets.s
    CALL    scripts/checksyscalls.sh 
    DESCEND objtool
    CC      init/main.o
  
  real	0m3.603s
  user	0m2.839s
  sys	0m0.959s

... and after:

  $ time make W=1 init/main.o
    CC      kernel/bounds.s
    CC      arch/x86/kernel/asm-offsets.s
    CC      kernel/sched/rq-offsets.s
    DESCEND objtool
    CC      init/main.o
  
  real	0m2.060s
  user	0m1.505s
  sys	0m0.732s

(done on an x86_64 cpu).

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Vincent Mailhol (3):
      kbuild: make rq-offsets-file an explicit preparation dependency
      kbuild: move preparation checks out of single-build
      kbuild: move scripts/mod target out of single-build

 Kbuild   |  7 +++++--
 Makefile | 11 +++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-reduce-single-build-dependencies-966646f25a0c

Best regards,
--  
Vincent Mailhol <mailhol@kernel.org>

