Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724130;
	b=AMB9TLxBgDTm11vUfmGhei6b/5SK3WZRHkU1dN9VZXUCaI+jahnbyvpw1ibKhtadFufR
	 0FY6U+8LUwdGnGD7ywXhI+rRdJbubDQ52xHMUDvxkyukoftrUgLa/AvJWyxZEUVp65CkZ
	 ++wa1gULke22wEywZ0f6jzNYOBZevdmKKzL/Yu7rA+pMYsrVMopYsr0IFis0DJFiv4cEM
	 zhwKovLxHFj/GoiD+NVs0Dj8UOddriQ2GJQqTGBtbp4Jux7ktTIPVOCU3K1F2HupYVTt0
	 Rlg42slVIhxrlEJsSvkKmUchcHetrg/w0A6AEP3W2ba+wet4ntelEYROIYNE1B48T4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=XR3esfciYeAILeLk4M7GhRXSZx24vdDScrjmqr3Tsx4=;
	b=0xEXF0+esiyCOFXn6/Yi75U2Mdrx8rucl+wCv8M1MfRLYycav0Nz5jX2YLbvCW+h315h
	 xu3/uVWP0MbJ/jMDg/vtCV1sxsVSmVk2KmFl3GAkIFwxtQBGeiQdZzl6lkmcMqHMPHzfz
	 prnV+ESympDqBALYs0IfAbju4KyzkWhOen0vNOOt2PFVOlqTCZ1pcsztVr92MJVHql7xa
	 njvsvioQe3VXtNH78BSRtJMF3zrrbLayqGBMb3rPlKNF+qyDw+rvogRpTbaGebDBTnROY
	 8rUvOJ52mNCLsefMr0MB/e/iRMT5QLtcGmWXgO4XBdcYcYy9RPTA3i3UoijGbUrd/mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=45.157.188.8
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8560A263B
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 16:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA8560A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVl6r1jzlJH;
	Tue,  3 Nov 2026 17:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724127;
	bh=XR3esfciYeAILeLk4M7GhRXSZx24vdDScrjmqr3Tsx4=;
	h=From:To:Cc:Subject:Date:From;
	b=CIRhTR7RkN4qYXCuuTUmIQxa09JKooeFlITVyRGNuxSfOKQ56sDZSGL2f1qKkXxUR
	 ktsxP2UJNJFFvs7w/jCSgbIrPX8vjz3EFR1wMXtdokGbPstxezVy8pCy5ALUtGENLW
	 rvCCiQjG6i7wld0cMfu9n0six8fmShOftcbNSVYI3hX5VAmjgwmo11LP8I/cYrh7nk
	 2Mpz1OdLD7vQ+4S8S6fV2zqUqs3FKoH+KykFnRAu1d30i684rllSvGDLthcehcyGCM
	 +KiChMLN10j/HlwwZ3CXnRJzF/0N3LcGUCqE+58BuoCL5WlFDOGjorm6ilbI57rDem
	 1JUhnpGuLzthQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVl35hXz66Q;
	Tue,  3 Nov 2026 17:42:07 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaJ-00FDeQ-0B;
	Tue, 03 Nov 2026 17:42:07 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: hamdy.aea@protonmail.com,
	nsc@kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] scripts: syscall: require a complete ABI name match
Date: Tue,  3 Nov 2026 17:42:06 +0100
Message-ID: <20261103164206.129733-1-info@daylightlinux.ch>
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

The --abis expression has no boundary after the ABI alternatives.
Selecting common also selects common32 in a table containing both,
which can include unwanted entries and inflate the syscall count.

Require whitespace after an explicitly selected ABI. Leave the
default expression unchanged so that omitting --abis still selects
every entry.

Tested all three generators with a synthetic table containing common,
common32 and other. Single and multiple selections exclude common32,
while the default includes it. Generated headers and a syscall table
also compile with GCC -Wall -Wextra -Werror.

This is a selector-contract test; no current in-tree table with this
particular prefix collision has been identified.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: b9da928abf45 ("scripts: add generic syscallhdr.sh")
Fixes: 27932b6a2088 ("scripts: add generic syscallnr.sh")
Fixes: 9df526b03c01 ("scripts: add generic syscalltbl.sh")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/syscallhdr.sh | 2 +-
 scripts/syscallnr.sh  | 2 +-
 scripts/syscalltbl.sh | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index 22e34cd46b9..8703bd1a7c4 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -39,7 +39,7 @@ while [ $# -gt 0 ]
 do
 	case $1 in
 	--abis)
-		abis=$(echo "($2)" | tr ',' '|')
+		abis=$(echo "($2)[[:space:]]" | tr ',' '|')
 		shift 2;;
 	--emit-nr)
 		emit_nr=1
diff --git a/scripts/syscallnr.sh b/scripts/syscallnr.sh
index 3aa29e0dcc5..900e0c193c4 100755
--- a/scripts/syscallnr.sh
+++ b/scripts/syscallnr.sh
@@ -34,7 +34,7 @@ while [ $# -gt 0 ]
 do
 	case $1 in
 	--abis)
-		abis=$(echo "($2)" | tr ',' '|')
+		abis=$(echo "($2)[[:space:]]" | tr ',' '|')
 		shift 2;;
 	--prefix)
 		prefix=$2
diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index 6a903b87a7c..46c65e88481 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -33,7 +33,7 @@ while [ $# -gt 0 ]
 do
 	case $1 in
 	--abis)
-		abis=$(echo "($2)" | tr ',' '|')
+		abis=$(echo "($2)[[:space:]]" | tr ',' '|')
 		shift 2;;
 	-*)
 		echo "$1: unknown option" >&2
