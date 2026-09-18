Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6020348C5D;
	Fri, 18 Sep 2026 21:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768091; cv=none; b=ZVZzWRG5+p4yD6XjpY9bjwCtajNgWxm2pttJpIvAvUo9o8AE1VoENTLzZQR2zyKcNFrv+1MjJTi1GjlI25aU8psR48okQ/MY2FMtTaHwDtzE+7yvviL800g11Qt0u3hNzXl4W0Ohv/19SJ+cLTyO/fcgIrJkqdZvkBpho3UYxBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768091; c=relaxed/simple;
	bh=O2hlwkAufNrMR+uFIlmrSAkYpcLS6FYqXxT24W1gzcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6Gpy4i/+OzROHtoVpHnOgV0UNnnKog/w6A7P5pCQ2Mpa2wbDe2HlLGU5G5tgkDEVJ5QQccnEOGrMMoE7WEKI8IoXaaEcM12+r32vwZ58LU/BJRVb2KhmS5tx5JCF3o2MeEc5eHPxbfQtc+H2rsXES5cy8+lSW11AzEko9jnIcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/u4V9d4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/u4V9d4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24FC1F000FF;
	Fri, 18 Sep 2026 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789768089;
	bh=Yd9AmOgN/Q25cum2jEcCgRSfXf6tk/+UUdM0ddYKZT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n/u4V9d41fCbxrKHbJcFkaCej72wTGtwCsP+FFelG4SvHzdPTSFMe7uQoZNpsqbnJ
	 VtEf8qPnBU1zNLj7VkIfSoj4AbFjnkHgLBn4eMptjiG2LCftGVlo09DMBJ290glWQC
	 uhh3MQf6MIL9CFMa+Z5Gpy0DS3GdR2jvNdcKJLMvTWjbY2X4tr7O7/cb/oxW/TGGl+
	 Rzdqu317bhJ05nGzdY3JcTyZm6FN3FeEXgQ5Mey1keyY7jzbwST/qPLbn0YmyYCq8f
	 aeJcw3RtulfpKJY9GsoNj4J0HMbU48yINYR2HvD8CU3J2gazYJrJGeoTdLC4gL0Cf1
	 xb93S3J7ZP2wA==
Date: Fri, 18 Sep 2026 14:48:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	kernelci@lists.linux.dev, automated-testing@lists.yoctoproject.org
Subject: Re: [PATCH v4 1/3] scripts: add TOML config to container tool
Message-ID: <20260918214804.GA1849926@ax162>
References: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
 <03e8513a-3480-42a5-9d1b-fad6c36ed07a@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03e8513a-3480-42a5-9d1b-fad6c36ed07a@gtucker.io>

Hi Guillaume,

On Fri, Sep 18, 2026 at 12:04:09PM +0200, Guillaume Tucker wrote:
> On 07/09/2026 13:10, Guillaume Tucker wrote:
> > Add support for a TOML configuration file to the scripts/container
> > tool.  This improves user experience by not having to keep passing the
> > same command line options all the time or overly relying on built-in
> > default values.  Include the concept of 'profiles' with different
> > named sections in the file to cover various use cases.
> > 
> > Command line options take precedence over the config file, and values
> > defined in profile sections take precedence over the default one.
> > 
> > Add a -c option to override the location of the .container.toml config
> > file which should otherwise be located in the current working
> > directory.  If not found, the file is silently ignored as it is not
> > strictly required unless the -c option is used.
> > 
> > Add a -p option to choose a particular profile section in the config
> > file rather than the default.
> > 
> > Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
> > Acked-by: Nicolas Schier <n.schier@fritz.com>
> > ---
> > 
> > Notes:
> >     Changes in v2:
> >     - fix uid / gid handling when set to 0 (root)
> >     
> >     Changes in v3:
> >     - fix logic when loading config profiles using None
> >     - fix typo with missing whitespace in help message
> >     - clarify how UID gets used as default value for GID
> >     
> >     Changes in v4:
> >     - drop registry option from TOML config
> > 
> >  scripts/container | 86 ++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 74 insertions(+), 12 deletions(-)
> Thanks for the reviews so far.
> 
> Do you guys need anything else regarding this series?
> 
> There's no rush of course and we're all busy, just making sure I
> didn't miss anything.

No, my apologies for not responding to this sooner. I plan to take a
look soon, I just keep getting preeempted by other stuff.

-- 
Cheers,
Nathan
