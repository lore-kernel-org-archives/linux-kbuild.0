Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC142480324;
	Tue, 21 Jul 2026 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656272; cv=pass; b=kGlnWax0ShIM8oBfhpGISUFMK/dWARD8iVbOMdya37RV7UYzgOZtY3P8pZq0Ksu9FuICd72v7ndxuW/GCRAmcZON4ddyrD4XByhmqLMC0B/1t+TEqDZH1jvRuvutp9LNO6pF+yHqAXS5pdPXJYP+ID7ziAu0D837PmR8I/ee6/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656272; c=relaxed/simple;
	bh=T3X+njmtfrUrp+1nxGHXPmYSgYeBdN7EjsKSd8lOyiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EJ/H25MSDsfvwjNNBJAA97eNZeBr1OqJfm6YH1YsJy2g5cOfP3MoCnnfS8In55f+E2pqpXnTLHA7AOh7TWaNy9bF2BsDX290VFLh6ELuDbclcIB1LjxfOzrPVKdjRqAEbRhmAl6YHx8LQNNIxa9eM7eTpILbQwarz/V/4TMt1AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=YtN65gm3; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="YtN65gm3"
ARC-Seal: i=1; a=rsa-sha256; t=1784656264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oG3OADkv5D6lFSAlpnv1U4u996VGjvG9CsmmU7kd7MhP0JYTc02nHvDsv3bqwCU5zyQUovujAvemAG/zzMGb8tmEGRpIxHs2PXsEzyP4NzFc9oaG6DLusEhYAPLdvJaEqyoEiYyWDVnz6IUWYng5RWPcZS3KIaOJFBPizNtJAiQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784656264; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LWR5oarPto7YInMTaRYfNj+M8NXlCMMCJAEL7sTg4TA=; 
	b=H3+UMmi3zgj3o1wbG29aJWbRuobnrakjNcAZD41hKjM6mszfRuRlJNvvDe/kuHAnStpy2kG2FabAufxnxG+mZBcpoKL7R8+B54aZg+Vzz4DJW//2jhlKQTaJ5PatlVB52g1dmmN8iViHzOqgw333rEfdUqPm/4DzXROYY9iS4PI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784656264;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=LWR5oarPto7YInMTaRYfNj+M8NXlCMMCJAEL7sTg4TA=;
	b=YtN65gm3SAVrbhTNRE9/w0pWz20ItuWpZ0JbBWsZ+FhXCxeevveSJGfGe89TbtvH
	Es/mIbho/U3fnLAt5WrPmeLL5oDEA0rnb1+Hyedls2Fn+bPv4KPREUQzin7ChbOeoBF
	sNDXTJtC3Y2NSluTsTICdvgqSscefdoI4xP9hccWp671rZRv3MkH1xrUj0yBvYeJmM3
	Zgj3yCfCOY4o1vD/HFA2spy8+oJr2ERhv613FaXRU5HOqjPsfxh3VlnhJ9UI2smCsmp
	O/7L8E02vmmXtGFj0hF31XhBQ6JnCaI9QQo40LxIrduDomHLcpp5UKwdGNfwT5w25Fu
	jbDJp/uT+w==
Received: by mx.zohomail.com with SMTPS id 1784656259829421.4065527351337;
	Tue, 21 Jul 2026 10:50:59 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 22 Jul 2026 01:50:48 +0800
Subject: [PATCH v2 1/2] scripts/config: Use POSIX standard ERE (-E) in sed
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-config-sed-v2-1-9f2c4b164666@rong.moe>
References: <20260722-config-sed-v2-0-9f2c4b164666@rong.moe>
In-Reply-To: <20260722-config-sed-v2-0-9f2c4b164666@rong.moe>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-4217c
X-ZohoMailClient: External

The use of Extended Regular Expressions was removed by commit
83e8b90e1d2c ("scripts/config: use sed's POSIX interface").

Before that, the script used `-r' to enable ERE, which is indeed
non-portable. However, POSIX.1-2024 [1][2] has accepted `-E' as a
standard option to use ERE for matching, and major sed implementations
(GNU, FreeBSD, OpenBSD, NetBSD, macOS) have supported `-E' for over two
decades, so it makes no sense to use Basic Regular Expressions any more.

Switch to ERE to get rid of chained calls to sed. A rough benchmark with
~1000 editions showed a 40.0% speedup (8.78s => 5.27s, GNU sed). The
FreeBSD sed showed a similar speedup.

Link: https://pubs.opengroup.org/onlinepubs/9799919799/utilities/sed.html [1]
Link: https://austingroupbugs.net/view.php?id=528 [2]
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 scripts/config | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/config b/scripts/config
index ea475c07de28..1f290372a4ce 100755
--- a/scripts/config
+++ b/scripts/config
@@ -76,7 +76,7 @@ txt_append() {
 	# sed append cmd: 'a\' + newline + text + newline
 	cmd="$(printf "a\\%b$insert" "\n")"
 
-	sed -e "/$anchor/$cmd" "$infile" >"$tmpfile"
+	sed -E -e "/$anchor/$cmd" "$infile" >"$tmpfile"
 	# replace original file with the edited one
 	mv "$tmpfile" "$infile"
 }
@@ -87,7 +87,7 @@ txt_subst() {
 	local infile="$3"
 	local tmpfile="$infile.swp"
 
-	sed -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
+	sed -E -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
 	# replace original file with the edited one
 	mv "$tmpfile" "$infile"
 }
@@ -97,7 +97,7 @@ txt_delete() {
 	local infile="$2"
 	local tmpfile="$infile.swp"
 
-	sed -e "/$text/d" "$infile" >"$tmpfile"
+	sed -E -e "/$text/d" "$infile" >"$tmpfile"
 	# replace original file with the edited one
 	mv "$tmpfile" "$infile"
 }
@@ -105,14 +105,12 @@ txt_delete() {
 set_var() {
 	local name=$1 new=$2 before=$3
 
-	name_re="^($name=|# $name is not set)"
+	name_re="^($name=.*|# $name is not set)"
 	before_re="^($before=|# $before is not set)"
 	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
-		txt_append "^$before=" "$new" "$FN"
-		txt_append "^# $before is not set" "$new" "$FN"
+		txt_append "$before_re" "$new" "$FN"
 	elif grep -Eq "$name_re" "$FN"; then
-		txt_subst "^$name=.*" "$new" "$FN"
-		txt_subst "^# $name is not set" "$new" "$FN"
+		txt_subst "$name_re" "$new" "$FN"
 	else
 		echo "$new" >>"$FN"
 	fi
@@ -121,8 +119,7 @@ set_var() {
 undef_var() {
 	local name=$1
 
-	txt_delete "^$name=" "$FN"
-	txt_delete "^# $name is not set" "$FN"
+	txt_delete "^($name=|# $name is not set)" "$FN"
 }
 
 FN=.config

-- 
2.53.0

