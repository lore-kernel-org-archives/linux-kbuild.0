Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F354718C8;
	Fri, 18 Sep 2026 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725857; cv=none; b=PdoREKkAj3eneq27GCFlrsI9xulOn3mQoX790jV226GBvKldR/aJonfn4eXILO5rRHe6M/M3v2lpBf2rWFcJ9xu+PRIARByL9Gx0SFopq++Ga0bIVhJsFNSj12m3vNYHz9Zud8ut+J7dA5t6wNaknrDhft0dRIMm87+7Z4N6kts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725857; c=relaxed/simple;
	bh=Ysypt3jaDk9LX7+TGymG8tHempYw1fVXIlZASODTJug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLeYuBV7OHTJGofzwRndkjd7UrCZz+M5wat/77vbKEUpOcHJD1d/MOGz7LliE2NlEbVB4bmJjWj/4tBd39OsiGMkbj+21nsmp+8PlWtT0ctAFruIqQCsvBPxpgs9zOkQou8Sk7ewcsnDw8pNhSZacyLWO6nY2CpECgRCJsnJnF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=JIHeV+9/; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="JIHeV+9/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB9D31F416;
	Fri, 18 Sep 2026 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1789725851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+gDfmq7h3XDTeTaV1GQcAeaaLYfq4gZqiyPpz3v3UQ=;
	b=JIHeV+9/N02rYia1t1EvGJLRUi0ZbHU4t5xlCuq92pB5vEbVOXOKzzOTqjHeOwgEkIAFzb
	pzZemjNFBUtvvTcNgcqlAW2mOP+mF8bdY3N+t/KlUlBK2msbtyL3J68+uQz76x0TU5ZQb0
	SsAEB7RZc0HqLqxp0J3aXcxXEu8b8DTlCs+uMvjkD8TIl6+CyV4UFl9B2eZiDpr8sH9SiR
	3bSitj0RwBrHeqiS1cIYxH583+qXmwtUph7ETUyEl7jNcTSwmNwLdJqxznngb+LthOgT7H
	TpvQxFxtgYI3CdhdOOMkgcRSKtQ1CuxiYuNOAa/tB2RAxupOeOPcz4i2BAuFRA==
Message-ID: <03e8513a-3480-42a5-9d1b-fad6c36ed07a@gtucker.io>
Date: Fri, 18 Sep 2026 12:04:09 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] scripts: add TOML config to container tool
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernelci@lists.linux.dev,
 automated-testing@lists.yoctoproject.org
References: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTFxUUHp53EL18Bb9M/JQza76+h26K4mGaSDc5K9XDme86qqMnFHH+rvynti1TbPuqrrc9xboTwjPdi2J4SEX38+db+SG75sK8c0TN5ScJZdIEvWoliaOA6h+tXUsq6PuPZUTut0MpLdmT94mvohnuNIeUeqE9wphUH5ZXd2szVUawzg1njiRkG8qir4EZeQlk7z1QcBzQ+30iYBH/C8NsuUotOoHF7iiC/2UQ/J0o0ofVsvYMZKf24ygtJVS3l+fLrX4UM1AM1QDtFBGi36R2qgWziM4q5xodfyHG2jeoHE+Zt3X+iutDD1qMe8xrm5y+znxfhDaAF1ioC9Dt5ZamwKDM48/ZW/e22b1PmbGReFQ9/YuLqjPmy06OwntVGS8G0ysfcgFlE2m3qHEcdkOI/MGu2V7VgawQG9WZ+4uw6QcoPrr0y2uqXLT4QP578jK0Z7v6i97udmAXuRAGSKkzxJlKtDqNKqQljfiIKiran5vR2waJgxNl99K5tVlb4VWGAQ2qd4aK7Wa4IYki278qTrGgGY3fe7eg6hd6FKVmwS9OyWfhuCy0W1DM8YS9boqZO5VPIEFyK1GGyBp5mUJCPYpJjpE5oD3Su/cZPbf6oKxm0Y9P+QGcXClTdiO3Y1wU+8Ofiwe5UQQX6v745qVzGRPHM/U0rQ2rzMCgALytE5Cw
X-GND-State: clean

Hello,

On 07/09/2026 13:10, Guillaume Tucker wrote:
> Add support for a TOML configuration file to the scripts/container
> tool.  This improves user experience by not having to keep passing the
> same command line options all the time or overly relying on built-in
> default values.  Include the concept of 'profiles' with different
> named sections in the file to cover various use cases.
> 
> Command line options take precedence over the config file, and values
> defined in profile sections take precedence over the default one.
> 
> Add a -c option to override the location of the .container.toml config
> file which should otherwise be located in the current working
> directory.  If not found, the file is silently ignored as it is not
> strictly required unless the -c option is used.
> 
> Add a -p option to choose a particular profile section in the config
> file rather than the default.
> 
> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
> Acked-by: Nicolas Schier <n.schier@fritz.com>
> ---
> 
> Notes:
>     Changes in v2:
>     - fix uid / gid handling when set to 0 (root)
>     
>     Changes in v3:
>     - fix logic when loading config profiles using None
>     - fix typo with missing whitespace in help message
>     - clarify how UID gets used as default value for GID
>     
>     Changes in v4:
>     - drop registry option from TOML config
> 
>  scripts/container | 86 ++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 74 insertions(+), 12 deletions(-)
Thanks for the reviews so far.

Do you guys need anything else regarding this series?

There's no rush of course and we're all busy, just making sure I
didn't miss anything.

Thanks,
Guillaume

