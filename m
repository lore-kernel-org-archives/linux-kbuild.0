Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A55343885;
	Fri,  7 Aug 2026 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132837; cv=none; b=bd0r3p4xgGqbjLR64+jKAUNGHm6MiV1+lK1ewL/IaPNRxQfpwM6bqrq5pcZxIqJDMfJiAQV84WB6+oR6unSq6s5PXncBkNBD3Q/2NKiqZrXafhNZIxxDuPXTIfNt5K3+J1LHSx9BONPTcCWMvR4SnUOsu65P290k9CrL9UF84XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132837; c=relaxed/simple;
	bh=mkbM6bArOzL5MkQ+PA/0IfmusjL4XNc9bXxr2/RJUjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qaddz+NEjIhmgJFYlacecJK9unb5f3P2tmMYtkitFUDQ1NsewK7fvNh0ovQEGKLZhnreNl8Y7Jqqn6icyegUOell+ifqfAf94q30NiKOKNCrrslyEJmKrVOV8vDwBXEf+vWfS5mUh5AN4WwgxAv4kXyBZd27oVNSwni8Brl0cw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=sEBcQKD3; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="sEBcQKD3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=sK11JsDEbRUin97IEr/7EqLJTeJQDkXGZz3roDUI6ds=; b=sEBcQKD35mSpbFynvFxdPpHues
	7mX6b/dN5/Whchy8+I647X21fEIa77eP9CuEz46Xu30dTzPE8m61ifrnsw1uIh61K77d9AErM8Zte
	5Go1a8MxaUNcxAzHXafyiVFSt0wB1oHoPxQxTilF1CRwIl4DG5ISsxzAHcaw+V/tBsjZHxbpzryio
	/6uQeg1rEx+qGFz5BC9gb/9qemYrTsRDtcuToOJ3SUx/ijd9WGYzPkjDbDM0tLgWCcyut6pdTVtFU
	rA1CcDnUE1uvnx7tPVxGt/14c2M5KcAQ+/KL4cE0nrSXy+OzRqVYpLXZBDNlspqHTK7dI1mVte9UF
	prHj39wA==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wsQLB-00Fa08-1V; Fri, 07 Aug 2026 21:34:49 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Fri, 07 Aug 2026 16:34:28 -0300
Subject: [PATCH RFC v3 1/8] syscalls: Make --abis parsing more robust
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-tonyk-syscall_table-v3-1-7c45a23c50b5@igalia.com>
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
In-Reply-To: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 kernel-dev@igalia.com, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.15.2

Some archs Makefile have the something like this as the rule for making the
syscall files:

  cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis common,$* $< $@

The $* symbol is evaluated to the variable found at $(uapi)/unistd-%.h,
where % is 32 or 64, resulting in e.g. `--abis common,32`. Sometimes the
rule for the file won't have a %, resulting in a trailing comma e.g.
`--abis common,`.

Currently this input is transformed into (common|). This is problematic
because grep will then match any ABI because of the trailing `|`. Make the
syscalls scripts more robust by removing any trailing comma.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 scripts/syscallhdr.sh | 2 +-
 scripts/syscalltbl.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/syscallhdr.sh b/scripts/syscallhdr.sh
index 22e34cd46b9b..bad1ab606a0f 100755
--- a/scripts/syscallhdr.sh
+++ b/scripts/syscallhdr.sh
@@ -39,7 +39,7 @@ while [ $# -gt 0 ]
 do
 	case $1 in
 	--abis)
-		abis=$(echo "($2)" | tr ',' '|')
+		abis="($(echo "${2%,}" | tr ',' '|'))"
 		shift 2;;
 	--emit-nr)
 		emit_nr=1
diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index 6a903b87a7c2..c4b1f85c2dd6 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -33,7 +33,7 @@ while [ $# -gt 0 ]
 do
 	case $1 in
 	--abis)
-		abis=$(echo "($2)" | tr ',' '|')
+		abis="($(echo "${2%,}" | tr ',' '|'))"
 		shift 2;;
 	-*)
 		echo "$1: unknown option" >&2

-- 
2.55.0

