Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881E6387566;
	Sun, 11 Oct 2026 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791753204; cv=none; b=BRPrlD2YfoswiL9XnkT2iYNFXsZJRcPsn+7gI1N6G745wJ9atsZsCromElKFz4vJXOheBsx6o9lD5xe7SynzMZp635oS+h77bmW4beyot7S5jGJoF11d1h5ryKOoTCOfaxhOEcT/RcFMylfyXsYMN4+A8cWuzGCg8QS6Ry9oMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791753204; c=relaxed/simple;
	bh=kNxwqKFDuH+f7OaoWDpdCM8r8zO93pvAKJYGlvtXcrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2xvyF1ICl4ajyrpDDZpNUV2Fk3QdzLDxM3uFoyYcv4YjfXnBUn+ZjZxa6j/5VIiuLpwfepCVCrtH4Cf1kdI7OIHrBLHt6vAEOfRxoS4g803eXn6xn1nZj/ApnWIu9S+EPOaW9vV2QIMbqmYAcSq/OQ5gdBKYKf+xIXVeiQDZng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=TxNN9sTU; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="TxNN9sTU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12D7841C44;
	Sun, 11 Oct 2026 21:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1791753194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nng+Q5MP6DyoM47RuivMXig2ptT0CD9F1lZB9fWGajk=;
	b=TxNN9sTUpDjgLwYj5KdgUP/y+VtCCvFZ6rJNFNsoYxTBgSXPVk3Mlj/nvhtgPlL9YSWRnf
	ehx/5XPnXZrY7CuAPtWBVTD5vPUehfhG8WBD5KcruVNjGBleObSm1S03EtGfZugNOPiB+J
	tjdUc8Eub+5mz/dP0qZJezvDmBbOpO/O5e3s/9juNewYN1pcLUBefT+W81n8Hkl/mD/+uK
	u35Dbdauk1csXeQWcVq/qYH8R4JH4SM7rd4oJfgIFz82DOcajL80bU27jwwrvwjaLCtCGZ
	pRSR/Zfm2TexDOuetDNUJiyBngU64WMbxjGnnONOLebqPOtn3R5/yqvqd3XFVw==
Message-ID: <b72d17f6-653d-4e11-ad07-b532bb83b20a@gtucker.io>
Date: Sun, 11 Oct 2026 23:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts: add --registry option to container tool
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTEai0oaN25vAZ/XFY5KQr9Ly0AX9XOERQJHNbqIePbXfeMdal6GwMNJ9RzLWkFDg49WY+gpwLJdLa+Dm3LxKn4RX16eYF6BC4pgQ89mYG5L7YoY24ENNc94YvzCt2VsVg1kQn9DPCqk03svQ8cgLntfoSRYBmYJ+k5EWgOQxwsG3i+ygx794In5brWuOv2/8H8KBHojk3xRuUmb63MiROAGhVSn9Kp4zET8fbky35yKDtIvfaBFIGFKF/By5zOpyH7qgntIhO6nfTS5HN0IMdFVU1ed+M7iNMH0xfGFwm3Pq73H0mvviTnTExGGmY2qsb/oiUyL47xwcIkCF+zO7OECPpQTVNrd/VvIqPISOM36V8DvUg1XlFzi7uv6K491oWYCaASC+hUXsc0vAOcU0NGbQOycx4U0G3B62f77gp+ORcejK3ioT05pfTB0pWBHKk0LMufNxObZ5E6TwLnKGqjrkWyp1yTqVGtfo8DzVDoOBrxtBpnZBXJOAujf7tqdYcCQVTGCt3+cgdocqAMrQEZK7gwzVjvNxmb+P0MRff4cpqcCY20hZ/fNUSaF0kVBwaQln51SdMsndDEKhaSiq5X1LpUltMJUKs3A9j728jUcrsAB+on6m8irIdmeKKQL7V+AsxsLn7e7YKSzL9y5SPQB70w4MEzZ3puLgLYhMXVnBg
X-GND-State: clean

On 11/10/2026 10:54 pm, Guillaume Tucker wrote:
> Add a --registry / -R command line argument to the container tool to
> specify an altnerative image registry and support it in the TOML
> configuration file accordingly.
> 
> This uses a mechanism based on regular expressions to parse the
> container registry and image names and construct the final one based
> on a set of priority rules.  A registry can be included directly in an
> image name; an empty string means a local image.  It can then be
> overridden by explicitly specifying a registry name via the CLI option
> or the TOML file, with the CLI option taking precedence as always.
> 
> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
> ---
>   scripts/container | 126 ++++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 117 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/container b/scripts/container
> index a3a55180d6ed..de72725656a8 100755
> --- a/scripts/container
> +++ b/scripts/container

[...]

> +@dataclasses.dataclass
> +class FullImageName(ImageParserMixin):
> +    """Parsed image name including an optional registry"""
> +    image: ImageName
> +    registry: RegistryName = None
> +    _regex = re.compile(
> +        rf'^((?P<registry>{REGISTRY_REGEX})\/)?(?P<image>{IMAGE_REGEX})?$'
> +    )
> +
> +    @property
> +    def name(self):
> +        """Full name in registry/image:tag format with optional registry"""
> +        return (
> +            '/'.join((self.registry.registry, self.image.image))
> +            if self.registry else self.image.image
> +        )
> +
> +    @classmethod
> +    def from_name(cls, name):
> +        if re_match := cls._regex.match(name):
> +            fields = re_match.groupdict()
> +            return FullImageName(
> +                registry=RegistryName.from_fields(fields),
> +                image=ImageName.from_fields(fields),
> +            )
> +        return None
> +
> +

As one would expect, Sashiko has some opinions about this:

  
https://sashiko.dev/#/patchset/06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker%40gtucker.io

I would say that at least half of it is slightly bogus but I'll
address them in detail in due time.  Also I've prepared some unit
tests to cover this logic and will send them as an RFC separately.

In the meantime, I'd be interested to know if anyone has some
feedback on the features themselves from a developer point of view.

Best wishes,
Guillaume

