Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724134;
	b=JJ3c/29tELK02eqyARp1VFMharG/HaxFPTFXcFq3KBXzUSnhJvYFBoaHXInDWxTA23UR
	 U80LU5lY68+cJXuSfuxm0+/MO4PZxlH4kLlT1WfsTlsjYE9aODdXHyk3m2uGRtGzd4+rS
	 tEZkEsL4IHvNfAa4MEqC7V8a65B1l3xGzVNrWiLLX4DouYO4WzNZkfOg+/qXvkJ5Tb2og
	 yMJksoKBL0zJnIFdUsG+t4PQ6LQsRa47Tmjraex2lQTa6VSPhe+UAbxmEpb+toY5u7PqC
	 ylYFZXV/PyOhYk8NHBFZQL3+rTh5omnsPVtNlFP4mI9raknMnRP7n+04r8vE5bA6pzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=4pmrIzUsWiwhucPqCXgk9qvUGEDqgG5sgdiKIfqOpKg=;
	b=CmQ/2FcNou+Pkm7iEul2MUAtZq6Pe60LujAZLO2DzZripRBf6NvoYlZYtzRHEJaCskbi
	 NcJzmTx8pDjg9CFmo6xda8Vg2pJjYqmd0hYuyHCJcOgmjVNXEb2vSHhUu/UUzLbo9Weo6
	 4AN9/IoewYZtvlAOAUoHXfbyI1zHYEpCK4FIxK70j4SL55+22nxW8SrqW0AMIAeeMZodD
	 YwveNdi17ygg9QXxhu1gW1F2bAVc7Xivze5+iFVJood/ZPOuY6ewqk/ENpqLvjOq/Cvhv
	 /28Sotxxu1CH4459ZfDV2lBby5njPTfa46OJaPVH6R8BB7B6sEOSRNiJvS4ZYWKRgYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=45.157.188.11
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECB560A6F44
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 16:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECB560A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVk2g2jzDwP;
	Tue,  3 Nov 2026 17:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724125;
	bh=4pmrIzUsWiwhucPqCXgk9qvUGEDqgG5sgdiKIfqOpKg=;
	h=From:To:Cc:Subject:Date:From;
	b=sIFwt7VMR8bdxsbJ7Nxg0zi6/kERm7YV/VQqbl2z93/g7O5c8yiap4zEfryPQHARK
	 wZVczcIXgp6tK47qnGkL5Ha6zU/1orjOjZCqEay40AX9CD+JVoijVrSMrb6BJ5gfsd
	 j5nmnDi3uXDmY/oQnsbUYEf86oJNFBd9Jxww9xJ5C0rtHxzIf2Oj+7jNPQOo6bw/o3
	 rwdhXGvd5o/G/js+ljvP9MlsA0MJY66TD9UckOVbg45uDM9Yh2Ac6uJQOIwpClzylZ
	 5RvfsapCrFjt1Bbn2VllbLyrVi9suQk9vkhDSsgt7esYgO7dW4WlxLcIHh463ey1oi
	 XgbH8N+YXkr8A==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVj2jZ6zlht;
	Tue,  3 Nov 2026 17:42:05 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaG-00FDd0-32;
	Tue, 03 Nov 2026 17:42:04 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: hamdy.aea@protonmail.com,
	nsc@kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: file-size: propagate ls failures
Date: Tue,  3 Nov 2026 17:42:04 +0100
Message-ID: <20261103164204.129681-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

When ls fails, set -- succeeds with no arguments and printf emits an
empty line with status zero. A missing input is thus reported as a
successful size query.

Capture the listing in a separate assignment under errexit before
splitting its fields, so an ls failure stops the script.

Tested missing and empty files, a 123-byte file with spaces in its name,
and a symbolic link. Successful output remains unchanged, including
the link's own size.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: a670b0b4aed1 ("kbuild: Use ls(1) instead of stat(1) to obtain file size")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/file-size.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/file-size.sh b/scripts/file-size.sh
index 7eb7423416b..8fdc9060091 100755
--- a/scripts/file-size.sh
+++ b/scripts/file-size.sh
@@ -1,4 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-set -- $(ls -dn "$1")
+set -e
+
+size=$(ls -dn "$1")
+set -- $size
 printf '%s\n' "$5"
