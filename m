Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A76B4A64EF
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072705; cv=none; b=Ym2nbf8le0IdMiJp8TDzsreSZtRlaDUJs9SDCDV2g+IAoDPwX4DC45Kw1xnSDtsWP3EbCcvhQZrOajS2DLj5//HtRpAbx1X1RfWWVgWuxQyrWsQXo0qHFfggP8Ggct0sPbPmZbdtGB/MbKg6XwUuz32LK0q+ds91/cINhq4yyB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072705; c=relaxed/simple;
	bh=Ho9YjB7reTrmZ0D9XSI3KdhGFFfKLwxERh2NVVcc4zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bmdGcR7RaxXL8BcUD1pPdjMM5o79QUtMmQMJf2JLZqIJkN2SF2mvAAu7dKE6IBZOkyrcG0pUf1MOcwAPz2DqRPkRJIP3Pqhv0HMAoxtLNp+kcS8KSzypa71pW/Ytd1e/WnG/lKd8Rvj52Lgbq51yuyZWoHxLZdSG0jISDMrQ8Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0jUX2Hy; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0jUX2Hy"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so2374316a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072704; x=1792677504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPZUBNn4GPGhvhNrbIpHNNxTG5Tr+rGqMQM1UOtv2Wk=;
        b=j0jUX2Hy3BpBcSejtgENCZEtdEpYk0s0RZwqfHH5ZZKfJAt5KXfG3mVT0jRZFeHMda
         oP7i6aWr0GN1EdJ3DIuwfB7hHbgFfI7odv6U5oKwmDZFtVjlmqzN9YH7GSZXJuSuV9bb
         X/21zjlv6gvCGMd74brv61lH+UsquZiabZU9XQ35CIz2UwMfZMqvM+MHdUFDuQIlGxS2
         S8ittq5h41OfqbKndRYL6ioEdk38Qe7v7SRmsCyZmbhTnQwwf4avqeZBYpaci1/9UWK9
         wca6saN9ofRpQn/PYcpk85eecV9UvINNHbvHP8l0Z11VE0+lJIQ0fls9veO7cvV0NwkO
         NFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072704; x=1792677504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPZUBNn4GPGhvhNrbIpHNNxTG5Tr+rGqMQM1UOtv2Wk=;
        b=vpW+jAGJfKtEMAPhCWxi99i1SUnf4G0UKAmg1jyk83vsPJlHKTPzfLBpLSaV+UgKxi
         vTe9GtEg6t62VYD1cuC8Zkb+iuFyzL44q80r0Lsf1Vo3qofq6xntu0468VnnwZ/exikc
         VXF4YDYz3M5AMHGrBzCt+DaMai4vMCBLPgKfRggNwVNKBaC2R81RHJ10moiZUaOptVev
         Lpxhm1Qml8ouLb+cytBrln2x33FCTVpSha2hjO4YwUgitG5lbJnHlsEFT35fWV+7HZZ1
         7xRH9lxkwv9M9gjbUV5f6ZtOSMJ9IKKlbzzyRLidU1J2mURgu2yJ47uebTiwxPt7pSaW
         5nVQ==
X-Forwarded-Encrypted: i=1; AKwUvByavjJxW6bbGx4UPMVqIxbSyGlHpXWpeAr//tbB0KbFPaLidI468QJ76id9CjmmO03wCSvj06gkkWP4Bx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaO00IW8dE0JO8j3RVl1SEbnonMluhgXPrK8kTVINVY1xryRRI
	1VUSw+lt/o+NRgAEtR4DJyMcwIIqwmrb1ksMq4jjGdgtHGOHL7FNNHN8
X-Gm-Gg: AYBFou2xJ6YiotHHR3f6ICaYwcmRR6VrhoiaChm69hNqjJYmO+vJlFP1jhcLtMobyAj
	ZDDLRZG0qzJB/bY1ohd8H/3zbHlfmnS98BMBc+qXenlwJdUa1bbFAJBivElMo/Dv5tL0byUYE4X
	nFXBICEw3NvgcIsmBFiuNWqjpNVkeOi74cHpvyw6O11OpGUeacDzWzeWkdlWNU30ojD0vwcgHTV
	oN+yXAEdVe3FYY0SxM/9RkaN80QelH4AaJzOh4b0sZSahR4A+VYnAQd8gPtmFE1z0ZZnnKGPEBc
	OsEChmzXSN+Sg9mRxq4VsKn9/UGleH2H3UPGxqQWoEVqtxTwUiNTdGIHdyVSz80T1eZAm1zA9nT
	qhmLy3dpp7vPRJujxqVSl48+nrf/Wx/G4Q6vDFZQqNCxWxtjLCuV+2ITZVpHwf8YWzMhQH9NWC2
	8OhLPOWFF4vVVo9elzW1jFZ56aHokKt0rshhN+y2ZJdXKgoOPd+EL9ZU29/c5MEY/+l3FAEzpa8
	hYl7B9ttk8ISUIhX7IGlESA2A==
X-Received: by 2002:a17:90b:4d88:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ab3a79cf22mr17057046a91.39.1792072703840;
        Thu, 15 Oct 2026 06:58:23 -0700 (PDT)
Received: from localhost.localdomain ([113.165.144.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm4566857a91.12.2026.10.15.06.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 06:58:23 -0700 (PDT)
From: vngocvan <vngocvan@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	masahiroy@kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gen_compile_commands: honor the build directory for modules
Date: Thu, 15 Oct 2026 20:57:52 +0700
Message-ID: <20261015135752.17028-1-vngocvan@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When invoked from outside the build tree with -d and a modules.order
argument, the script opens .mod files relative to the current directory
instead of the specified build directory. This can fail with
FileNotFoundError or collect commands from unrelated artifacts in the
current directory.

Pass the build directory to cmdfiles_for_modorder() and resolve both
the .mod files and their associated .cmd files relative to it. Absolute
paths continue to work, and the output location is unchanged.

Fixes: ecca4fea1ede ("gen_compile_commands: support *.o, *.a, modules.order in positional argument")
Signed-off-by: vngocvan <vngocvan@gmail.com>
---
 scripts/clang-tools/gen_compile_commands.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 8d14b81efd73..149135f85f19 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -124,7 +124,7 @@ def cmdfiles_for_a(archive, ar):
         yield to_cmdfile(obj)
 
 
-def cmdfiles_for_modorder(modorder):
+def cmdfiles_for_modorder(modorder, root_directory):
     """Generate the iterator of .cmd files associated with the modules.order.
 
     Parse the given modules.order, and yield every .cmd file used to build the
@@ -132,6 +132,7 @@ def cmdfiles_for_modorder(modorder):
 
     Args:
         modorder: The modules.order file to parse
+        root_directory: The directory where the objects were built
 
     Yields:
         The path to every .cmd file found
@@ -142,11 +143,11 @@ def cmdfiles_for_modorder(modorder):
             base, ext = os.path.splitext(obj)
             if ext != '.o':
                 sys.exit('{}: module path must end with .o'.format(obj))
-            mod = base + '.mod'
+            mod = os.path.join(root_directory, base + '.mod')
             # Read from *.mod, to get a list of objects that compose the module.
             with open(mod) as m:
                 for mod_line in m:
-                    yield to_cmdfile(mod_line.rstrip())
+                    yield os.path.join(root_directory, to_cmdfile(mod_line.rstrip()))
 
 
 def process_line(root_directory, command_prefix, file_path):
@@ -206,7 +207,7 @@ def main():
         elif path.endswith('.a'):
             cmdfiles = cmdfiles_for_a(path, ar)
         elif path.endswith('modules.order'):
-            cmdfiles = cmdfiles_for_modorder(path)
+            cmdfiles = cmdfiles_for_modorder(path, directory)
         else:
             sys.exit('{}: unknown file type'.format(path))
 

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.56.0

