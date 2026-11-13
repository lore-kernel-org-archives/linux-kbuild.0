Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592637;
	b=Bibyr+1ohLioNndtDI7+F1Fet4wC9KSz3yjxUIIhv2EjsJ2tO3Uq11cGjMOyJvCpx9Kk
	 t+yOWkX1TG1QDQRJ+YBYQh+5IyJpD5Ey2jI8WwvIy8h+MzQujhz2xBIkUsYh5F9sN1LxB
	 jXEDGBqXOoLGuArqBGFlc2BIVlTm2gBMS9ucW894z3DZkFFCh2RXDxR251WqdAaxsUYxl
	 j+15/aVKmc6g9MQWWlPFtUAMGprN7XOggoVENKCWpFuGjgeLYfxClC0EUKF8laOQqi5Lj
	 oPsY7E2gUVQ9GmNovloMTqGoxycoYiP/m905cK/A2SG/bd5t6ZT7HudGAf4W8a9Yq2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592637;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=EPUXYWrxU/x3OmPy7SPZ8/ZMiP8CaKcFQCpXyhSAZ0E=;
	b=Yn0UUKCfAky3H+cdudOLXhjm2NcDw6SslWbJqCGGqLklw/6QQ0S5CIpmKZX+nVKmquTR
	 2hguM2qgcwnqbtkveeNIGGLdKVbXnqwLCsoOTNEW9U39OjeNxATNE7iyoPuL8EjFNbTBx
	 pF2W75FAXhhgbtaw+2xvGpfX+kqxlDJy20OMGJPpcEkxyw/Gudn3eSgUUGNCr8Hmx5nYn
	 M8FIa918Gw1XBWrx9ABou9puvR8CJzEUqUmApWd03tLAgpori0gLTSiWB++aNG8x7om/A
	 Au6TQGhyLKfCDMUiJxBhUi8U7fuCpI1FcEYu1FDW4S0WoAFyWQaRIQrj6y2pRbqo4Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7w8Ua3X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D58606B22B;
	Fri, 13 Nov 2026 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7w8Ua3X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D591F000C4;
	Fri, 13 Nov 2026 17:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592636;
	bh=EPUXYWrxU/x3OmPy7SPZ8/ZMiP8CaKcFQCpXyhSAZ0E=;
	h=From:Subject:Date:To:Cc;
	b=m7w8Ua3X6gDhkydD/6GZE1rjlGxkHq4lC33+o9onh+PQTLul2fWbfKAq7lFE42sMG
	 W2NpaaxEReXdP5NadOYvC7VLcsabHcLAQ1x7G8Cbm7PtKN13QHR3+5q4g1Wyl5uupU
	 gskurmnI5qPvfoHJ1qNoEICYlmWTS7/VDAMRRK5OihedpYcijMarosBAVxr3oaiFVV
	 ejBNtbjAtUPw2naZr/7drzzfdqh5fWgK3XCK15nvXTdWVfDD/+9boWOCpj4KKrlC6q
	 tXQu81HQRvU8gOLscEtFr8YuLV+Yos1PdCnBuBlg/oGFVR65D+/CpTLyc60AdqhggU
	 rhVE12de/y+Pg==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH v2 0/3] kbuild: reduce single-build dependencies
Date: Fri, 13 Nov 2026 18:57:04 +0100
Message-Id: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwW6DMBBEfwXtudsASpyQU/6jysHYA9kGTGobl
 Cji32ugH9C9rEaaeTNvCvCCQOfsTR6TBBlcEuVHRuamXQsWmzSVeamKdOxhRwMO4toOXI/SWbZ
 4wFk4k0hcKaX2qikPOjeUMA+PRp5rxdd102Gsv2Hiwv1zePyMqTtuNqp1AJuh7yWes/tastseO
 zwjLZybhDj417p8KtbY/0dOBed8LCpldHVS+nS43OEdus/Bt3Sd5/kX3KxBixkBAAA=
X-Change-ID: 20261111-reduce-single-build-dependencies-966646f25a0c
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2910; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=IoT9iL3Q0RAFUvMn0K2EKBkPNujVcMRP1+fv3QjqjtM=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFnf/Sv2GQuK979LV3c8I72bdXmEOcv85YvuPZfOZF34w
 enP5722HRNZGMS4GCzFFFmWlXNyK3QUeocd+msJM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RgxcnAIw1Sf2MzK8q1r427rlFa/xhv277lbGuoi++Z+QwpfzL0bP/M3kqRGXGP4p+r1I0J9
 rOMeIJX1KFNON459ljbUn7fqzVmhq33+l8i/MAA==
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

Move the generic preparation checks and scripts/mod out of the
preparation path for single .o builds. The first patch is a preparation
change to make rq-offsets-file an explicit prepare dependency. The
second addresses missing-syscalls check and atomic-checks. The third and
last patch addresses scripts/mod.

== Illustration ==

These are the build steps triggered when just changing the compilation
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
  
  real	0m5,808s
  user	0m3,216s
  sys	0m3,196s

... and after:

  $ time make W=1 init/main.o
    CC      kernel/bounds.s
    CC      arch/x86/kernel/asm-offsets.s
    CC      kernel/sched/rq-offsets.s
    DESCEND objtool
    CC      init/main.o
  
  real	0m4,064s
  user	0m1,901s
  sys	0m2,728s

(done on an x86_64 cpu).

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Changes in v2:

  - Make modpost_prepare depend on prepare so scripts/mod is built after
    preparation completes. This addresses the sashiko report:

      https://lore.kernel.org/all/sashiko-outbox-211218@kernel.org/

Link to v1: https://patch.msgid.link/20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org

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

