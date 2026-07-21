Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21B415F07;
	Tue, 21 Jul 2026 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656268; cv=pass; b=j2fhcp+IIDWX1TAmAU9tbBvretDypaAb37hpDFVE9PlvGSItHKZSDZNX+BnsUK6Z+azOkAzWooRsXyAxA5yFiS+ddExumj61hMbQf2r2JvB7iqp489vlejact4C+jHm89j08BtAq5lRpnY/hGmZUlfutfIyh/K5XDEJgjTUsXTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656268; c=relaxed/simple;
	bh=LANxHCVh7J3OpzFvABd6iJIjrfA/hB5bj+v7wA7hGmE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JeNaJfxwAq+74F3ZgAvtbaXhZQVYDfy5zFwqQ59T+qszTTILU1iEC4PPk0AVRsgeFA16ys1E5D6DbNwOOyu6U1Yprz9warLOjf6cPBX3RtYmC1+a0XBvzcvMt0WuombnLHaX81a/PT30m19aowsqhZvKoQnsCVBuWLN0cXSlQIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=OkCteaQ1; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="OkCteaQ1"
ARC-Seal: i=1; a=rsa-sha256; t=1784656261; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EYl9HmbJmmo1InspCWnWVb/RKn9YDF8JmY+Ebb7jzR6bLP1ANfKcY+yK64LvXNd4Kh7Ev9B4SCmB56wes2hOT/hkQxtfRs2gVhLydG+r6e+OtfW8dMG3UukpQbkk3a5e0p+aehkxXh+i+BRlnrmVXtx4q4zIovvPn9XJTKliFsE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784656261; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5Br5D451RkpeQDiSk7ttYdD90EyiqMzCiwxHX0SN9wo=; 
	b=n+QbntPbeS8Ocp5k1EVEvRVGrWqKnM5vV9+rQY85yrbSeROa5lFRH35zN48ts+HfEfnxdqy04Fkre0h7u2icIl5kIoihnFfi/wSJ+5DpDMhPweOft8Zxa1spIxrPW3ULiFxCd+JAHzcrHZplEbwbQwELWFc4PMdw2bmZ4rHdYnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784656261;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=5Br5D451RkpeQDiSk7ttYdD90EyiqMzCiwxHX0SN9wo=;
	b=OkCteaQ1iXSJUfxwp8siY7wONPeATNWUCVHVFNsicy5bRW4oR0z+SySdxAyJZenI
	8cT05pxV0v7/e8wMvkhlNjIaEZhpY80om1zOYaZ7oH+pb0SMhizwQTizH6XItvCAaGE
	VvfugANMMJKUo3dkkC8nJBEaBxSqwIQzMRvEy6hdJZQ9TrPn0Ky8u2JW9TKGiBHLfta
	ucLOUPxL4ISA1KB/XDfdmXJYpy1ZtJ7w8lwMYYzVUKMziFnrECvSYBWyhIc1lRxmdf8
	Ii5x73KSKgIcl25oVqf8sKO9X/nf9mWmQzzQ7KMmLNNI1/ewknjAQAssfaiQ9LG6uwS
	D0mtj9OvJQ==
Received: by mx.zohomail.com with SMTPS id 1784656257251581.7645297876197;
	Tue, 21 Jul 2026 10:50:57 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v2 0/2] scripts/config: Use ERE (-E) and in-place editing
 (-i) in sed portably
Date: Wed, 22 Jul 2026 01:50:47 +0800
Message-Id: <20260722-config-sed-v2-0-9f2c4b164666@rong.moe>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBBFr0JmbU1bsI2uvIdhIcwUxsSWtNhoC
 He34MblS95/f4FEkSnBpVogUubEwRfQhwr68e4HEoyFodNoGtWg6IN3PIhEKExdm+aMtpNIUAZ
 TJMfvPXZrf5xe3YP6eStsxshpDvGzv2W1eaClNtJI+x/OSkihnbNUn5C0VdcY/HB8BoJ2Xdcvi
 rSynbUAAAA=
X-Change-ID: b2d6414d-config-sed-633649d7b0de
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-4217c
X-ZohoMailClient: External

The use of Extended Regular Expressions and in-place editing was removed
by commit 83e8b90e1d2c ("scripts/config: use sed's POSIX interface").

Before that, the script used `-r' to enable ERE, which is indeed
non-portable. However, POSIX.1-2024 [1][2] has accepted `-E' as a
standard option to use ERE for matching, and major sed implementations
(GNU, FreeBSD, OpenBSD, NetBSD, macOS) have supported `-E' for over two
decades, so it makes no sense to use Basic Regular Expressions any more.
Hence, we can safely take the advantage of ERE and merge chained calls
to sed.

Before the said commit, the script used bare `-i' to skip creating a
backup file. In fact, major sed implementations have supported `-i' for
over a decade. It's really doubtful if anyone would still build Linux on
a Unix system without it. The issue is more about how we use it:

FreeBSD and macOS disallow bare `-i'. To skip creating a backup, an
empty string ("zero-length extension") must be passed as a separate
argument following `-i'.

GNU and other BSDs accept bare `-i' to skip creating a backup, but
disallow passing a zero-length extension.

That being said, when thinking about it optimistically, using `-i' is
portable as long as a backup is created. Hence, creating a backup file
with a .swp extension (the same name as the current temporary file)
anyway makes it portable. The backup file will be deleted on exit.

A rough benchmark with ~1000 editions showed a 48.6% speedup (8.78s =>
4.51s, GNU sed) in total. The FreeBSD sed showed a similar speedup.

I split the series into two patches so that PATCH 2 can be dropped if
strict POSIX compliance is desired.

Link: https://pubs.opengroup.org/onlinepubs/9799919799/utilities/sed.html [1]
Link: https://austingroupbugs.net/view.php?id=528 [2]
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
- Link to v1: https://patch.msgid.link/20260607-config-sed-v1-0-2ff7e35de271@rong.moe

---
Rong Zhang (2):
      scripts/config: Use POSIX standard ERE (-E) in sed
      scripts/config: Use in-place editing (-i) in sed portably

 scripts/config | 42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: b2d6414d-config-sed-633649d7b0de

Thanks,
Rong

