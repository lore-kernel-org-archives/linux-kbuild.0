Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E304F7970;
	Tue, 21 Jul 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656275; cv=pass; b=nY12fK2TKV1zwlXYRNOx1rcBScBuleIMrqWdpwEu/lPxobvrhrSR2Ln8ordYl7MnLo2ekdtQQIvhl7UJc1cLPEBj5iytkU9FiR/rcYQBb+dNJ/XnBQVJdEErjE7nugwt8zk9GTMZyxIoG/bY3AJPR2mu6MUa/8Dxbp8Jok0NAlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656275; c=relaxed/simple;
	bh=/bHZxP24S/a32ddemO2nyQzVvN6SB+5I8ulGT9BPtZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpMKgcN9GihFrTnKC+MVLIRODyqcaCHTxylubUw/mH82vTJSIMTEsYBam2mR5rfw9fEZ13ieXc98duDRFuykPaAAwd2hfmNHf55EmNT3FMvrYh0uEPDvIIIdGp62JovVBHdTjgSnPUMWwbx+gT/yEVGAFzL7yHAsv3saCgAV5uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QRXfWSfB; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QRXfWSfB"
ARC-Seal: i=1; a=rsa-sha256; t=1784656265; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YL6Czc2YzKz8Es/jJE2VNf0uMY9QW2SP1qU5A9whE+EQi7+NLKh/PAkojA/m8YxzceWNvjorHRpHI6kC5g5LQBkWP5TLAO3NBa9fyPZDPCbyWadbQ7zdzyHT4b5dVGTQCLnCdy1cDBoya1hE4IFTL9okKMNIEsLcycpq9EP0AQQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784656265; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iClaI/sWwaLtVWHmwtEQ7Uu96zELQpNcbpHi63H13HE=; 
	b=juz+/k+Pv+YKxeoGV2lPWy3X62qERJd7I1zkL2f2y16zbujeDpoj02XY8usnPFeFOr1DxgTjl9g3+LJBILLri5YwfC/5Id3z6wF4rJJ2Shi7QGmhsIe8ahEo0htFwnnRg0ubVGfEbeTOdmOhH0n2b2+jHj8HOo7Sf5wAUR4JdK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784656265;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=iClaI/sWwaLtVWHmwtEQ7Uu96zELQpNcbpHi63H13HE=;
	b=QRXfWSfBy7n8SAGLbY7lR1z1gKCT3924oagvX1ipGQaTyJpTQfLzdUewv6OHAAm7
	gJZOr/jQyCRGnOIuW1/uCR0QmqoEjhxn+hYqp47CLlTpQlynj8nNxtMJDLRP8t0+DN+
	R/5SrtAVHxonDA0wKWpHKBK6C9/elMeIPfP3ya1d7ex7XR7eJUKk5P7firHKCjB1E+e
	iHucb56n+uqZYZw9ECF7ugdLTKahsWsgdIfNsIW9e+3C1mj3pTemcgGyt51npVt/7rf
	8tdz960qXtgOM5lCF19VRrQ+V8ZZUkz/VBVqdY3NX0I91T0R9QW1ctkihrRkS7btzFa
	2/8WA4IwvQ==
Received: by mx.zohomail.com with SMTPS id 1784656261808226.94518967895692;
	Tue, 21 Jul 2026 10:51:01 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 22 Jul 2026 01:50:49 +0800
Subject: [PATCH v2 2/2] scripts/config: Use in-place editing (-i) in sed
 portably
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-config-sed-v2-2-9f2c4b164666@rong.moe>
References: <20260722-config-sed-v2-0-9f2c4b164666@rong.moe>
In-Reply-To: <20260722-config-sed-v2-0-9f2c4b164666@rong.moe>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-4217c
X-ZohoMailClient: External

The use of in-place editing was removed by commit 83e8b90e1d2c
("scripts/config: use sed's POSIX interface").

Before that, the script used bare `-i' to skip creating a backup file.
In fact, major sed implementations have supported `-i' for over a
decade. It's really doubtful if anyone would still build Linux on a Unix
system without it. The issue is more about how we use it:

FreeBSD and macOS disallow bare `-i'. To skip creating a backup, an
empty string ("zero-length extension") must be passed as a separate
argument following `-i'.

GNU and other BSDs accept bare `-i' to skip creating a backup, but
disallow passing a zero-length extension.

That being said, when thinking about it optimistically, using `-i' is
portable as long as a backup is created.

Use in-place editing (-i) in a portable manner by creating a backup file
with a .swp extension (the same name as the current temporary file). The
backup file will be deleted on exit.

A rough benchmark with ~1000 editions showed a 14.4% speedup (5.27s =>
4.51s, GNU sed). The FreeBSD sed showed a similar speedup.

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Fix a typo in commit message (thanks Nicolas Schier)
- Do not delete .swp file when sed is not invoked, e.g., `--state'
  - In my test, unnecessarily deleting .swp file makes `--state' 10%
    slower due to the overhead of extra fork() and execve()
  - Unnecessarily deleting .swp file may corrupt Vim even if no editing
    command is passed
---
 scripts/config | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/scripts/config b/scripts/config
index 1f290372a4ce..7c083c860341 100755
--- a/scripts/config
+++ b/scripts/config
@@ -71,35 +71,34 @@ txt_append() {
 	local anchor="$1"
 	local insert="$2"
 	local infile="$3"
-	local tmpfile="$infile.swp"
 
 	# sed append cmd: 'a\' + newline + text + newline
 	cmd="$(printf "a\\%b$insert" "\n")"
 
-	sed -E -e "/$anchor/$cmd" "$infile" >"$tmpfile"
-	# replace original file with the edited one
-	mv "$tmpfile" "$infile"
+	# We don't really need a backup file, but in-place editing with backup
+	# skipped is not portable due to different implementations parsing
+	# arguments in incompatible manners.
+	# Create a backup file anyway to ensure portability. The file will be
+	# deleted on exit.
+	sed -E -i.swp -e "/$anchor/$cmd" "$infile"
+	SED_EDITED=1
 }
 
 txt_subst() {
 	local before="$1"
 	local after="$2"
 	local infile="$3"
-	local tmpfile="$infile.swp"
 
-	sed -E -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
-	# replace original file with the edited one
-	mv "$tmpfile" "$infile"
+	sed -E -i.swp -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile"
+	SED_EDITED=1
 }
 
 txt_delete() {
 	local text="$1"
 	local infile="$2"
-	local tmpfile="$infile.swp"
 
-	sed -E -e "/$text/d" "$infile" >"$tmpfile"
-	# replace original file with the edited one
-	mv "$tmpfile" "$infile"
+	sed -E -i.swp -e "/$text/d" "$infile"
+	SED_EDITED=1
 }
 
 set_var() {
@@ -122,6 +121,14 @@ undef_var() {
 	txt_delete "^($name=|# $name is not set)" "$FN"
 }
 
+SED_EDITED=0
+on_exit() {
+	if [ "$SED_EDITED" -ge 1 ]; then
+		rm -f "$FN.swp"
+	fi
+}
+trap on_exit EXIT
+
 FN=.config
 CMDS=()
 while [[ $# -gt 0 ]]; do

-- 
2.53.0

