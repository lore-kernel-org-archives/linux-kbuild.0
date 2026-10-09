Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506593451D6
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2026 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568734; cv=none; b=ch7map26ZRnwAuhQWJKyhcPvi1afMgfq4Zhy/9r5geIaydm3Vb/IwPVWkZajqtDcEGNPkDk3DL1ad+R/aNAWzZuNp3jr0/WQtKmfN2UX0lM8AJj4LdczSlUAHYDMt4u9jFwcevgCnIIvzWISG98BIAEDDIj1hwF6twLe2xWzH7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568734; c=relaxed/simple;
	bh=TRAbFOmIuXO7lFa2+5mHt2V6HZzH9UnQ+dCDMXHXAdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmeSANeKij5VVIPovmvazfifa//zr0PT1Lhx/XbPtLufMtrDdU7F5cImCErELoN5TL3oAqN4ZeYMe6cWWoXakU6t9y5A30QpKzbHq7FY5MCfMzBF4YjP4Oovuebdr7ks9EJXjM1eKb45nng5Bk/jdQra/W2g6uPvYspu7kuyhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akfm1XvL; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akfm1XvL"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so3261175a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2026 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568733; x=1792173533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFMcmEx2+Bmb7Wycj6pYJAy5yt+ElDaMMm24XjvbUJI=;
        b=akfm1XvLyOQ4jtlxookXLAzwE/Y24FOt5MXTJ8ml42M4qBDQxAm9notKBI9bkmaPDz
         NLWqKb8hTUn+SusPb/XOviRJU4IxJB4rhKPA21ejPvi7VyFTIi1/gkOB+s2a1oYkSGjB
         7l6itukZ+uk+iWLolJm3EkKf7dUaMogBHdVvTlH/fxTY5iORSCyY6pdb0DDpcrUuX8NB
         7gkRWbfEIFZ7VCJzdmGylxs1T5O+l/fWpVKir5kU1L92ZKKrPHZ/Z2Dovqo+8KGXR5Q8
         CNPkG+ZyAljUrirFcxdnKxhqvCxiaGsVUxNUkrhy6ih9SVdmE+8pCRiZO3f1IJ4iEnTp
         Becw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568733; x=1792173533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFMcmEx2+Bmb7Wycj6pYJAy5yt+ElDaMMm24XjvbUJI=;
        b=T3ltGbq4MWtdKpKFTDzrabjXgmRgagiALVSTvXTAumVjfvPKUTo9rlGHuScdAcPF46
         cA7ITtCrHFZSHBPNdq4MsSe/mcpxpFAzXmE6mHTWNsJngXrhj7sedUsOWkNkadiaHyxR
         rZ8c8/l4NzAiJE1CIS7eKpVpcuAoeRUSq0GPEs4S1Qmr8BBh31E4maK+oCbWTwBLd5On
         xdlXl4o1Gnpc9bcZe8bPIXgztcvz7yHubsX05Lg1uEc4EJLoeKfgmmMDrKxFVEg+70zf
         clPOtNMECz4XFMjPpxqYLW1KK4nfDodhiMDFWCcD+ZXnR7T/oVTaCe038SgIXA7wBpJI
         RtpA==
X-Forwarded-Encrypted: i=1; AKwUvBxm9tWhwzoSvjvtfULN6Razr10Q+KEqMgMJXyargW+wBxtG5ytY3LkpjcmfbGp3rtWZPO1rn2+ABFDH030=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ7MJlHD5cR27EVYkbu9XzKE6Ya/PKzXPsqRH1X2jt0gYVSObo
	HIrb3JZj39/xCoRqoe4HB3+SU+1C0JLWQhOGz6xIFqYe8OWmDhwKfl1E
X-Gm-Gg: AYBFou3G5es1SgqO0f7spzGo1HA76sw7jNCTdLn4etgJb8ZAKz/G5sOEHW9wGXleczM
	IZvs2tM1KkHOhQJEcmghwZjz3XyX8zgzF4RVyQgt4UgF7tKtkjNF9KVhK3lKas50m9fxg8p3Erf
	6Ct2gqXC8wai3vTzICdDNUQH/SXvQVv99oWA/3LsfcRcOBEYS7XxMf8Z7TLy+6HOFtW8FH6TySs
	nlD5vqkJhQX4fLL/XCtjaAMv9E66/ZJSzEcRFGdZpKkmD/08v/LFZlcqtH3UIAIDQARYUBuSZLN
	SyvpLdLx0QWLhFpUQbZq5jihqF9tgnDm/rGEQGoF30y7CMCUXltS0vOPMvsaOusjiCxJYAiz4BE
	dWd3dkCROBZu6lSBARQwIjDTPYlRKRJV//A9SNJF8m0rOjM56+RVRvsZZ2af+3AOOZkP0JDE3cV
	OtssIiDwXOQNPY1fmUrF3eyahHB8MCwIlp7BuqbtW6rjKyGiT/w/Kf3HLSd1uRm1Rs6ueYx7Dsc
	p1yJxroMCK3BSgUZKo0dX0qajvjb9KHmdFxphGDNI8tbsAPMk5JkdcmsqQtfbxrJWWxDXP42jkd
	V1AFpe7miHm8vFIuBbpHW24PLKBJTo5lD2SNIpICyPim2f3QEtcySsH+UGOkBYNZ7sfwa+7ml/c
	kwhhUKZ+4LJD4c6S3TQ==
X-Received: by 2002:a17:90b:3c8e:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ab3ae696c8mr1964314a91.51.1791568732651;
        Fri, 09 Oct 2026 10:58:52 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:d58d:323::50:f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm4415918a91.11.2026.10.09.10.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:58:52 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clang-tools: Import os for broken pipe handling
Date: Sat, 10 Oct 2026 01:58:32 +0800
Message-ID: <20261009175836.2277-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Changes in v2:
- Drop the regression test and adjust the commit message (Nathan)
- Use my full name in the Signed-off-by
- v1: https://lore.kernel.org/r/179017337986.52388.7943687183785012868@gmail.com/

Sorry for the mangled resend in the meantime; this one is sent with
git send-email.

 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
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
-- 
2.52.0.windows.1

