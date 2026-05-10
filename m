Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163672B2D7;
	Sun, 10 May 2026 05:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778389997; cv=none; b=HbMdDX4GEiN2VHvE751nFkAhHT3OzhURZhm2kyrvzWTgRzoUkeH1KA6NyGYNpkgIDWEJD5/Fqgi3JMQe9fjL5aOTHGCePGm75q64K816WsPTc4G3A3NaaTdnPLnA15vJiVgZSz+RncigZQPjO9pn6C0iAG/HrLdmGkPvgmVb3Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778389997; c=relaxed/simple;
	bh=APkIGPuK+GMEaXSWSbPlDYmPcoV5yWLRF61qo7M3Aso=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V9wedn0ekvmGc5vbpCZlR2MPpQXFc3psTSzHagsg67B6IsmeS96gQOxTlJyX4jJls5x9cWKL/xNhJ7/beGnO1p3Ivzj7VZ8CLnKGOrAp4WPJfRk3AnzWngZlVkpYQRxIcSt1ZCkI15RcwmPNRjAsA2Wer2s7LfVDogL2J6owSiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inai.de; spf=pass smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id E63981003C5484; Sun, 10 May 2026 07:06:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id E15161100C0B4A;
	Sun, 10 May 2026 07:06:16 +0200 (CEST)
Date: Sun, 10 May 2026 07:06:16 +0200 (CEST)
From: Jan Engelhardt <ej@inai.de>
To: Julian Braha <julianbraha@gmail.com>
cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com, 
    akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
    gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
    corbet@lwn.net, qingfang.deng@linux.dev, linux-kernel@vger.kernel.org, 
    rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kbuild@vger.kernel.org
Subject: Re: [RFC v2 0/2] add kconfirm
In-Reply-To: <20260509203808.1142311-1-julianbraha@gmail.com>
Message-ID: <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
References: <20260509203808.1142311-1-julianbraha@gmail.com>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


On Saturday 2026-05-09 22:38, Julian Braha wrote:
>
>kconfirm is a tool to detect misusage of Kconfig.
> 3334 files changed, 973634 insertions(+), 2 deletions(-)

Good lord, how is anyone supposed to review that amount –
or is it just getting rubberstamped anyway?
