Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086EA5237B4;
	Thu,  1 Oct 2026 19:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790882857; cv=none; b=Bglk6oiWGNyjrQR8XXkNzuGK+G8GTXfJhZGvtQtmcz85/CDqa5FynKWgAiE997Lsg8zoqh4+sIGxUX+my0qqogzeVwVdVeDVYV/GHmjUhE6tTfcGFiE7vEp7G/sCHLjhv1t/JdPhAcrJCfX9OV4L+rKE9CGg7BQC2Oh9/IPUZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790882857; c=relaxed/simple;
	bh=vn+qqaYk4z6YgEZ+TlE7YA/j53pxar7/x8Q1Br6M+co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqfHgeX3rwaZ3f7MLw6RkPfEv5dBA5GnGtO51EH9RtK1MIk+5D8Br2fitDTpYqW/Ox2Kf2eIWHigtGyT8av1jYK6xHYtJVpybwtn1yBS3yLzT41CUvbeo5wSkxQ406ArYctLFt78aS6QNxgq9efOv8qlSOnv4vTr+mDiR1/cUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZ9uKnA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZ9uKnA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B631F000FF;
	Thu,  1 Oct 2026 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882855;
	bh=dBN4zbJr8oauLEWEDSbcgR2yKMHy1f9xUTNa1sHzSiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NZ9uKnA61nmgFbFwNY0AtIsUMAQ0qLBkNzcfUAZLrzHFVUNCBMZAoJPzVKSma/LjY
	 yfedkCTpFx//jr8DW0MWHPiRlNkarfB11cm201pe1GvHHaAg88ubATab0fGInMkcjg
	 6rmFf/X5TN9fKs2UwdVk6TaiaestHKHZPhFBFQ+gHohxHiC/BFLm/wIGmiqGayu1/b
	 8APi1BnXiWV0ckZ/RSbKRexRFuHmYF9Wg9NsirExO88xQeCayYnLPD0jJzH1IxESxW
	 LNGLQl6oI620uZyzovHmt08Gmwqsi5JqOHuRCYRRvkWxR3259bLhkKJykhjQlxIeiJ
	 iep9Vq5tqAqhg==
Date: Thu, 1 Oct 2026 21:27:31 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the random tree with the kbuild tree
Message-ID: <20261001192731.GA713751@ax162>
References: <ar5-4Yq3wtmXTWnD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5-4Yq3wtmXTWnD@sirena.org.uk>

Hi Mark,

On Thu, Oct 01, 2026 at 04:40:17PM +0100, Mark Brown wrote:
> Today's linux-next merge of the random tree got a conflict in:
> 
>   init/Kconfig
> 
> between commit:
> 
>   f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.toolchain")
> 
> from the kbuild tree and commit:
> 
>   56ff95ee85715 ("random: vDSO: avoid call to memset() when zeroing reserved parameter")
> 
> from the random tree.

Thanks, I knew this was coming and the resolution almost looks correct
but...

> diff --cc init/Kconfig
> index ecd71b38fc560,98d8d7fa64c5c..0000000000000
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@@ -1,7 -1,207 +1,5 @@@
...
>  -config PAHOLE_VERSION
>  -	int
>  -	default "$(PAHOLE_VERSION)"
>   
> - source "scripts/Kconfig.toolchain"
> - 

You appear to have dropped this source line, which I believe is the root
cause of https://lore.kernel.org/ar5-8C-j_JT5OYQm@sirena.org.uk/.
Restore it and the resolution should be correct with no build errors.

-- 
Cheers,
Nathan
