Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58811386C3E;
	Sun, 13 Sep 2026 20:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330265; cv=pass; b=nueFRLHZ0OA9RFfS6j1DjxHnwdVCuTUH2Vmu89AQ0N4XLl1zVpdbI+8y7z4VSkpkGhcLJSg8KkXRlXKnoSM60HhSeKyy7u8ZKCs8Z85UUvxeWo6ChPJZH5qQIvoo3YQGF4AhcJySCXIPIhRHqgRGMRyzhuA9XeBQFI4xXzg0pnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330265; c=relaxed/simple;
	bh=1Q+GQq+uMcPO7YhrthJksF1q4vmvqcLVl4wMNW5wi6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NEvTpZYpr9DwdP5hx4386/AtLOiD4BWhnPS9l0zpfEfWy1qgImw6L1XavCs477t/ImrUInY85jMO+n7TdP142RcPz5qyEiIg3PDxV9U5kydAfCEMnpNKW8UrrZJPTLddPywKB0Xz8GMJjJwfXh2RuS2wubHIiLCOY3Ln9HejdNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=O9UJ3trI; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=whQ+MuQ+; arc=pass smtp.client-ip=81.169.146.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="O9UJ3trI";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="whQ+MuQ+"
ARC-Seal: i=1; a=rsa-sha256; t=1789330070; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aFC4tolnAZq9ej4ZYSWKNw1FaCOfDwtp9t5gBojOEyQSvBxrXGz6BkkycPKPgGzflO
    /lSIC4NwO+bm6j1z2G5h9jY6JTgW3TsLhSqQEX+K+I7c2LQzrfF8BPjzjHBOaxWrBfs/
    wtH01A5ibTmP66CeGPj506IEMo3jNSTukiXnj+p1xCkoScqbSyaDUJrFleAUyOf8pj6v
    ew0QNxeVwWjfkdAknqhWZZHHj4mmwJtdy2uq1RcYlC2QUbrm/VXij8X8NvvfITkxHh2X
    pwskKFEPraNWRufB3tNsDgefKLr/OzRT17XcZjABRbn47mJbob7r3szxenB5+hvraoMm
    K2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1789330070;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qd1BBf8NmsBZ4nI1PuXbOCWs5aWpybFN8MP7hg3NeR4=;
    b=OQcy+RT0J+q4qQL8lHBEVPn8eTkbdK9CqfQJ177ZkU5kQ4q/yNGFV/lQxqL+EOSpWL
    BBUbnsS7DaY8S8uvit/6CSdGGghXQZCK5fM+9dnJ8JUZR8Y9wqXOKXjbUkH9tFSTrjz0
    ujy1kHJScUK2CtFSgZyw5EmVxktK2uZi8V+DR/Y91ti1rf82QvrveQNd0Dq29w7O/ofg
    60AP6wZYmRWprdBtIHGEGTlFwHBin/kbheHp/OUDrAf0Z1PIKWN3pL55bV/UJ7hfVgik
    SRAju9OLg+5+Mc/PO+2EXLhNlDGvywKzn4+o0CbBu5ZeGBj1FrE0cnZ+cKL09wdPkJR6
    i6zQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1789330070;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qd1BBf8NmsBZ4nI1PuXbOCWs5aWpybFN8MP7hg3NeR4=;
    b=O9UJ3trIISE8oVt2cWNVCTcBmbC9qVaGKGoh0aMwNpKWpqFQlkrjoMtDeSQNc5TJc0
    5UaWvFdanTWTwXGzVNfUf36Gbqj36y9yyjtkE20hRMOAbM/CP8MvQw+eAOvHbts7t7/y
    1nn8ojgt1pvIbR7OVf65r3xINYXnnnDgCY4l0r67OAj7hKtRk22Rz0MxIzVQl8Iu9TKB
    02PTBzjOx9EMFYpXNoLlX31GjBBj2H906FwR4BskmeQqR0nWsoYqIHfS4d3b5txT3Aha
    aduX6eX5OSzCMhGAfA9YEsPsTaEUP0mMZQHnkLRscSHZ8PI+eL4xTgIGW3w4p5I67UkF
    /26g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1789330070;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=qd1BBf8NmsBZ4nI1PuXbOCWs5aWpybFN8MP7hg3NeR4=;
    b=whQ+MuQ+hieTE3/djHlZfYDfkEPWcYMvArCTiMz8ZrK8klO2kAcGgOrQuT/34+/ghP
    3wAZKXptcO94iFJMrjCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV0ZpclciN8saFYq97YBFyveGds+G7JwsV8A=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.2 AUTH)
    with ESMTPSA id Q0498328DK7oAqn
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 13 Sep 2026 22:07:50 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: [PATCH] kbuild: fix spurious error from find when generating asm-headers
Date: Sun, 13 Sep 2026 22:07:49 +0200
Message-ID: <6e2a2c0cb5d7885ae0dc146025d21c23904d7b70.1789330068.git.hns@goldelico.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The *.h pattern should be quoted or we may see errors like

  find: paths must precede expression: elf.h
  Usage: find [-H] [-L] [-P] [-Olevel] [-D help|tree|search|stat|rates|opt|exec] [path...] [expression]

if the working directory contains some *.h files.

This was found in a cross-compilation environment.

Fixes: 2d69b891e6461 ("kbuild: Support generated asm-headers in subdirectories")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 scripts/Makefile.asm-headers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index b38931314ad7c..9db8ab0145a44 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -48,7 +48,7 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
 
 # Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
+old-headers := $(shell test -d $(obj) && find $(obj) -name '*.h')
 unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
 
 filechk_wrap = echo "\#include <asm-generic/$*.h>"
-- 
2.55.0

