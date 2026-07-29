Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2483339934B
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Jul 2026 23:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366768; cv=none; b=TlgyO9tflQrrigKoOFhgXZlxexkwuwJ20RsFIJDfa70AVc2GGT0Ffhx1SraG4TxbkvwNiUD0Ki70ef26MbxOZMSCBaGoQd3jl69ermney6jHI4nRKkToLm4s+F9uaj+SHoS3XVeGw12gDN7hR7JzGPFjt8EoP4bQItjl7SFjJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366768; c=relaxed/simple;
	bh=acbw+VEZ44L0KTBhSNsUpmPhKCIsdypS3UGOK/N7k7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChFJZlp93szV8w8l4Fik/k9ata//Y7cyxigY93RjzwS4QCi5nBAHKjmZhIHegDgfR6WiQKudYBYeZzRBa5Ju1TvlGYRbOWWmBAEMpxF6VNjMpRik/4FvDqLvk+4puydbuLhIgX4mwMMi5Zpojh5Wu7RcUZsq76nS4S8POhc0N6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbLVw1ax; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbLVw1ax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC38F1F000E9;
	Wed, 29 Jul 2026 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785366767;
	bh=6xjykPwLqp07Yj8Nz5Dja/w5/4zam1SCgrJiVoBhpL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LbLVw1axVIVx78DtiRT0nls4/cw0t4zlIoW17W4U4PltQh9dhSMTQdYxTCPZRmZ7T
	 dkfSlcR8Rd94tE6+YoVngrC8JRKvq0QTSOnntdUMoDXxevhwiUjIIO7+14xvH/VEsw
	 FGeGLge4R+QjYRUSlMyOlc9oS61AI14ZzzUfEsDs72CrABD4BJmu0tKNTSEe0ZIST8
	 6XAsUM+YIxt2ByicOgOTAKIIVJ0dct1+XWi5axakxyPrRLqwba8Ln8W0KT3A/Z+WS6
	 hcrrVCIpfmq1miA+rwGrkuPw/1ibBRPQUi8mVKG7csF3zh6t268+pyp5YRL6SqfsBH
	 VbRzV9RVAYz7Q==
Date: Wed, 29 Jul 2026 16:12:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: logafinl <logan_finley@selinc.com>
Cc: n.schier@fritz.com, linux-kbuild@vger.kernel.org, nsc@kernel.org,
	rashinkar.anish@gmail.com, thomas.weissschuh@linutronix.de
Subject: Re: Re: MO flag not working properly for building out-of-tree
 modules, tries to replace the Makefile in the kernel's source.
Message-ID: <20260729231242.GB1120279@ax162>
References: <20260722-conscious-petrel-of-acumen-cdac27@l-nschier-aarch64>
 <20260729223222.6922-1-logan_finley@selinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729223222.6922-1-logan_finley@selinc.com>

On Wed, Jul 29, 2026 at 03:32:22PM -0700, logafinl wrote:
> Hello,
> 
> I was running into this issue myself and used bisect to pinpoint
> c9bb03ac2c66bc5aa81b51ea0792477524c2763a as the commit that introduced the bug.
> I don't have enough experience in Kbuild to understand what in that commit
> causing the problem, unfortunately.

Does

  https://git.kernel.org/kbuild/c/39d6e68f50f4a444a6ba23b9ea2eaee806601c6d

resolve this issue for you?

-- 
Cheers,
Nathan
