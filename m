Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDE52EF653;
	Mon, 20 Jul 2026 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576557; cv=none; b=hShs0ZiF3qmbxHbjzAe71MIoL0mHEh1KtnhW0COq4Upew4fuvJHwYY2+QDTQ+eIK/B/da6Pb8t9Pw72TLn/GqG0WsNl93PkNDf3qalFDBuQtMcokwbAxF26Uz14lINd8d7BaIFZPYgezIsajpqmT7aikuvyG/BcDWdF4VMWYLPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576557; c=relaxed/simple;
	bh=VL9JoaBo2Tyvtx3KCG/EG1OWIPlukqLj9EDXK1LSkJE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ex/64Gfe4VKRge8IB37cPwawZJH0mNVSpYor7JfmtUioZcNYLo8cuC3mCUOcExT/B+26vogg86Dc9ky6wpSrNB3Ny2NPrwjOWWj3RLvwl+PgoPtryePpTcMECvLhwFZiyHAXVy/15x+MurEHfOfNAf3W0oB68qqMe9xcJrPGkNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyZc4ZCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyZc4ZCr"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E3EE31F000E9;
	Mon, 20 Jul 2026 19:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784576556;
	bh=PnC2tpruvLJIFaFXI7Qbzh+hFxljb/Gfw4hX/Oz8/Do=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=KyZc4ZCrCfXJG+r/TGYqM1wEO5CDA94mjd4Sfa87QNUVYp9rM+tOYmwZGCmJ2YWic
	 fbAWBP8vnyKfCorr4hFNLUOgMAtJSDkb6+irAvj8KBsIGXMFJe1PotTHDqca7HXh5c
	 vRz73oHzia+E2T75Qae5sLYRaAvYcqTAhOhHu783km20KNUoDbQfL2j+qJXus6wFC6
	 eJMMInUyDchUjW8b3SnMkNOM71nIBP6otmJu0hvdptfRGpEgZyggSW8v31dV9lmzku
	 1kBPAs4oyUuXFF+nkPtcOs1yn82KHjMMjMMeB7SSn/V29U//CEJicqAvcXRijEX34p
	 tTeulfYj1D7xg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] scripts/config: Use in-place editing (-i) in sed
 portably
From: Nicolas Schier <nsc@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260607-config-sed-v1-2-2ff7e35de271@rong.moe>
References: <20260607-config-sed-v1-0-2ff7e35de271@rong.moe>
 <20260607-config-sed-v1-2-2ff7e35de271@rong.moe>
Date: Mon, 20 Jul 2026 21:40:58 +0200
Message-Id: <178457645829.1375946.15414498343066263816.b4-review@b4>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=VL9JoaBo2Tyvtx3KCG/EG1OWIPlukqLj9EDXK1LSkJE=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqXnnN0B8PsGo5XHzheuzxBomUgvm7VijcLnQ1y
 jI6pZgnLF6JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal55zQAKCRAHUgpwFiYS
 aW4tD/48KmB5yaxG8fGwUSVJ2ui6/jjf54ff69mDJ7p2PWSGwy7IJ3YwGehPNrin1C+gvcafqfN
 Yg2BUTwtYyJs0wHU/VpA2msxSnmvbznd4/nRDWwekQ/rSeNPAoNcBmytd8wBXVgz+DPJliYPIwx
 9P7/LDY436krCIeLUW3yVNwNwtz2pwvPm0RyuEydeGv2oY41iOgHxwmb6D5LEYTpehXYefb80os
 OUXMjAkPZKA8XbwjfZaaRXBWrJBsJ05V55//FHixMbXG7+Uf0yR5q/LR8X89/Rruvrmh8CIGypk
 d1koT6Qg9E8i/CApRJQIgc2Dd10flI4OH73SNfhjwuXfOjaLEC4bXLnv/rC9UKCm9NM1nJTp/lJ
 1oScRfLtXntMKeNwyI0+5lOsvUi+ODyFADkBWL15m77Hc9NVY2BXQ7AGOoIFt1snfcW2dhrcbUG
 cwkKJLfC50CMPvfgmKxY6c1q5zMHndgtchG34NpCo3piCiORhwo31vRS6fSZLzq5UAVAFS7y7Qo
 Kiv4ex+spYmwV+3+87h6PULTdBd4aoVAY6fRgUvGSLFQtjPX/F+ax1h0Qy8Mz57XKcFvy1CtVfm
 m4T8948cIO0nVoRgFqBs8CLQObSZNL2E0SHVj0IDRxp/IfToyx411AWFpn8yBsi4JkNTU1sUN7I
 nMwuZcliXFt6jkQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> The use of in-place editing was removed by commit 83e8b90e1d2c
> ("scripts/config: use sed's POSIX interface").
> 
> Before that, the script used bare `-i' to enable ERE while skipping
> creating a backup file. In fact, mojor sed implementations have
                                   ^^^^^
mojor -> major

> supported `-i' for over a decade. It's really doubtful if anyone would
> still compile Linux on a Unix system without it. The issue is more about
> how we use it:
> 
> FreeBSD and macOS disallow bare `-i'. To skip creating a backup, an
> empty string ("zero-length extension") must be passed as a separate
> argument following `-i'.
> 
> GNU and other BSDs accept bare `-i' to skip creating a backup, but
> disallow passing a zero-length extension.
> 
> That being said, when thinking about it optimistically, using `-i' is
> portable as long as a backup is created.
> 
> Use in-place editing (-i) in a portable manner by creating a backup file
> with a .swp extension (the same name as the current temporary file). The
> backup file will be deleted on exit.
> 
> A rough benchmark with ~1000 editions showed a 14.4% speedup (5.27s =>
> 4.51s, GNU sed). The FreeBSD sed showed a similar speedup.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
>

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

