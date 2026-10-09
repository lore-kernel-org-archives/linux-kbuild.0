Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926EF38911B;
	Fri,  9 Oct 2026 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577860; cv=none; b=pXU3vVoOhzKPwLspTlpPhNO/81HM5Sr++EkY8WI/fwLkAu22tiyCQCqyyHVgpOGbvIaZkQAtaMaMZoYxluhnjDxtZdcD7UQQQcTUznEbKCR4eMxnIpEhV0BaLvgsvBSD5AMM1WfHCEC2XXtA9inbkqka6W7p1ig85qm2a/71GMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577860; c=relaxed/simple;
	bh=sOxYgsLk3wPekQxycBq+35SQBLhASd3yv8eObh+5VCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DJEtEbhs5lGRIvZELQV3FvtuSdEGOTU1mtnk0V8+sVk2nv8NyMRAixPBBeB+/So1H6kd8ege10/8fAczMOwvqs61xv0H/8/K7Km6VPBBkQOMeCJwG2hVGStXyiTePjVWXd2/OOVJ1R2Xa1ovyKtURXY6x6YnC1Il2enA7KwDZz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inVReumB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inVReumB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292EB1F000FF;
	Fri,  9 Oct 2026 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791577859;
	bh=fImw0Ude8v6Hz7QkjwI7DOdFiyS/E68iNqWNfKVFSRQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=inVReumBhV7G1SPUTdDS5L6++i2k9Vut1Ijz6LfR8Dbm4EgBvrgIBeSfYtDwyTnRt
	 pwKcN2k+GJGpGjPBYaHRnSntydFAH8sHuhYJjvY3v69MJ4BW770KGS8/2hZTT471Ks
	 7Ta39VMEP9kTFi5Hw9rKBfNCev8X+Kg/+0BzEI2kdPn2LBhYdf+4uIPCv2iscmqyhd
	 nPy8pSsC4VD6SNs1uvUp8NuZyKrQS1W6ez3TdCo4djcgJP03h3CEgRiwkGzmQ45kVc
	 GZ5RRwEyHoDCnXu85nxATILXTaCgVn6ZmM7OV1pX8prjCuVmcaPdhnhpxU0YHQO2bn
	 X9eqcJaLVovEA==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Leizhen Zhang <lzsx618@gmail.com>
Cc: julianbraha@gmail.com, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008164521.3684735-1-lzsx618@gmail.com>
References: <20261008164521.3684735-1-lzsx618@gmail.com>
Subject: Re: [PATCH v2] kconfig: fix infinite loop in conf_choice() when no
 choice value is visible
Message-Id: <179157785332.772825.5892929930472929089.b4-ty@b4>
Date: Fri, 09 Oct 2026 22:30:53 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=776; i=nathan@kernel.org;
 h=from:subject:message-id; bh=sOxYgsLk3wPekQxycBq+35SQBLhASd3yv8eObh+5VCM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkn/f5leM+L97NPyE28bs7w+mlguN4Zvp7eVYz6J9m+F
 XVHTZrWUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACZyMJuRoZf36vuK5R8uCqx/
 f6Sgo7hk2Xv5I/aH4262Xy7eysb38B0jw9GPi7oE/W2vrl1v8Xl7s3bAepnameetm+4HeYt0pc6
 JYQQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Thu, 08 Oct 2026 11:45:21 -0500, Leizhen Zhang wrote:
> kconfig: fix infinite loop in conf_choice() when no choice value is visible

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: fix infinite loop in conf_choice() when no choice value is visible
      https://git.kernel.org/kbuild/c/52f26261e27db

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


