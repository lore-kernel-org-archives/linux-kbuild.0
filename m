Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392ED37F317;
	Tue,  4 Aug 2026 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844056; cv=none; b=BdW5XJPf4GK7hbMKxMuDwrjSWEGrFUTEpmVbpG9cxiDEvUmlf9lrI6/FO8C/jAnRS9WBqTLIzjchayGdvni9q73O70W+CLBuNgwDRMEWr+HI4He7+OKpe0B/u2uImS886/+nx/CHql/AO0Gmr8/giTrjGUfauBQanSngNw0zvOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844056; c=relaxed/simple;
	bh=/aLADYUHbzdPB/rxjzUy7ZoYtsk8Y54o1w7CyE+cffc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shukgkmoKyFtdWaUqwddF6gb37xJuEskYVQM8RWbi6A3XGAGbQXzMHTOecNG7F4HiF1dtfSdMrIBSz+yHpk0GvaIQY0EcjesQx3nVwrXkAsPDCqzTNd85FVUmIGf88k8482OAztyC+o7+SkD4RdfJau4xqyPCeZ2/N9mO/05l0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxbUhdZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxbUhdZB"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5A9BD1F000E9;
	Tue,  4 Aug 2026 11:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785844054;
	bh=qnG7ioML9pnbleihEkIPHjMMg9P5H3fvGYFuWEZU2I4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lxbUhdZBm8Vf8NsFulA7P6V5eoN3d2Lsx4KjgALMkThhvJefcwcUZivrfOxA7KZUH
	 RBvancpbaUnPm1wJUJ6K5hmd5KuIrg6T/Rod06/iX6E58ceKshWWSLc7WfFQTSQrqP
	 ZWLgjTnuc2t57E9iKMtBA0cMp/ubEDIdV4Vi93DZfmd/Ec//6Q9sJynTKWGHVKeW4F
	 M/XWdbVgSHJ3Gwr2RlIx1Fs4mRcNPi3r4QHHtr3szYgNdyUsyyoJYt6SihdTovLukw
	 R+8vBttONSlPvcToRWkFHfHueFfxnDxRxA9TMfgFOFB+3pkkVt9dRkuS8A9AWpvKS5
	 PSWqgmW0Y93ww==
Date: Tue, 4 Aug 2026 13:47:16 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, arnd@arndb.de, stefan.hengelein@fau.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nico@fluxnic.net,
	officialnaumansabir@gmail.com, rdunlap@infradead.org,
	vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
Message-ID: <anHRRDliJ777LnhB@levanger>
Mail-Followup-To: Julian Braha <julianbraha@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, arnd@arndb.de, stefan.hengelein@fau.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nico@fluxnic.net,
	officialnaumansabir@gmail.com, rdunlap@infradead.org,
	vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
References: <20260715220149.48700-1-julianbraha@gmail.com>
 <am-W4tuI0k7MKXVP@levanger>
 <30650585-9d4d-4771-af7c-7c3908281719@gmail.com>
 <20260803174736.GA1067866@ax162>
 <58a8c7fe-378e-44be-80d1-01479c425f5a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58a8c7fe-378e-44be-80d1-01479c425f5a@gmail.com>

On Mon, Aug 03, 2026 at 07:26:28PM +0100, Julian Braha wrote:
> On 8/3/26 18:47, Nathan Chancellor wrote:
> > It looks like number 4 has been picked up as well. Given that we only
> > need three more patches to be accepted to turn this into a hard error, I
> > think it would be better to hold off on taking the documentation patch
> > and just push for the hard error next cycle. If these patches are not
> > applied to other trees before 7.3-rc1, we can ask to take them via
> > Kbuild with Acks and/or stable branches for 7.4.

sounds good.  I'll prepare a patch for the hard error.

> All good on my end, we can drop this patch.

thanks, removed commit 63dad1769941 ("Documentation: warn users not to
use select on choice options in Kconfig") from kbuild-next-unstable.

> 
> - Julian Braha

-- 
Nicolas
