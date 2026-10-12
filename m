Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146B3A6B66;
	Mon, 12 Oct 2026 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841745; cv=none; b=MCR50mYXC2g+3Ss+OA+tPJOYVJDZKgtr/J14HOVJFm5Kk/LcpUyGjdREm/ry3ARjGGjcvvIhMiDivuXN9uR6cosjWezzKCgDBrhgm1pgzgRHRDGorCCVLbhVjLVuTK8aa5U6RGlNfjoj5IbvspZ6YpL5e7PLq08v9Y+Kva+J3aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841745; c=relaxed/simple;
	bh=9O+S18ohAa+SRT4nMaiVCkc2ADc0xfm/vCDAJ+1cTq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YH22WY3oeoThtfKM+nhztHZP3m9n4vXHQB/ZUUA9Lnt1XgwKIyfcti6rw6kgfQhmNr30pFHmN5ASUYQ/tnlZskBq0UhwVmx/e7en75HHtzkB//lgZx4rwJjhHnpSz1cB2oaprqpE1nQpYfeTwRlSbdYFlDs5wpMbJGT0I2B3Hdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=gLUx9aJu; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="gLUx9aJu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B0C93E999;
	Mon, 12 Oct 2026 21:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1791841740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfsCaxlmAmcvq19B1+qtzJN0P3yMbGAFyPsksLli2yQ=;
	b=gLUx9aJuNgxFyIUIbnYuPTldKuqQCfbTPojdP3mwZ93EriGQcTnFMRp+zPDsFxQgCrfe+U
	U2rHqdcwbDnAg70FOfjfgH3LD0z+4blCpeSwllqODTv7wbXAxMY7f+iMf/0kl9KvwINhiB
	71jEQN5B9P7w12Gb1NKVQuNuGUHcYX8MTIjLvJ2NvQIZ69WEuRFQRiAmnn9RVeNM3ZIGCc
	whm/68RVLbrGmLHZawkt1m+5dj1z2fGQYsTONafbeyrYmIuP4xOaCGhjjiJLTbUaiIUWN/
	SiVEYsvAezZ/Fnqppa7ljaTtW+p+CmQC01ghcV3djHkrw+qGfNtkVz2mx2Q3zQ==
Message-ID: <d3237240-0de8-46d4-b58b-5a3a12fe4840@gtucker.io>
Date: Mon, 12 Oct 2026 23:48:57 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: dev-tools: cover registry option in
 container.rst
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
 <d7d6735e4b287ae0cb6f873ee8763820cb6e1d7e.1791751900.git.gtucker@gtucker.io>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <d7d6735e4b287ae0cb6f873ee8763820cb6e1d7e.1791751900.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: dmFkZTE0jojyXgEUHXX0d8eRXkelO3JGbn4IXQXnMYmpdj9XbD/qUxwqWX2CDnIQN6FbJQVWtTd5mStCLbA8n5c1DZ4t+eaSIA1GBTKssV75K0AdeuwX+qA2VQcc8l0PeC1pYz9ofLjXNqTkiROngoLbdR5/2jAsEHYKKDqPjq6WryD7YCL+9O2Euhofp5Vk6sfe6EBXFSYXCGSdSUSfXjJaGDpL5080jPTQiQ1oBbBNJ+cRGOTT9LarMwITY5qt9LfLju6Lqx49ITD8NjllaG6p05txA9FILob9OQ9450XNJe5Fx6b4BCUFTqkbin3p1PeI0Vb3OEgk4heo98PwBCdF35GnNjGy7FQAhJOu9lwl2R5YWMZOr7oVNsynRVWZG0MRFRK77d09euIYVDBmQxX2BRBmBR1rWAQUnqcVo+8S5E/Z2Jg9kj6BiqcbHASvwZKq13foxPziMvbMsoZ5W+z2mB/7ygRwPFtFF55bChQkUV7aLI9BHQMgo0HVLnedcYywyiuRirsMEZRXKx9p2Km5UmwkLm22rwy8tMc10oW26y152FU2vJwLmFWi7rXwoaTaKHHkPTPfI8+2fksAhR3dlpVn32/AIcUQeiEOlc7cB2Ox2qPWo/iDm2WlEfZ1LzMn9KbqSki2n/wqN9cRag88eUAQy9nxeBD2XAZBkk7lRDmZwQ
X-GND-State: clean
X-GND-Score: -100

On 11/10/2026 10:54 pm, Guillaume Tucker wrote:
> Add the corresponding documentation entry for the new --registry
> command line option and TOML configuration file.  Update the examples
> accordingly to show how this can be used to override a registry name
> already defined within a default image name.

Sashiko wrote:

 > Does the patch contain these examples?
 >
 > The commit message mentions showing how to override a registry name
 > already defined within a default image name, but the examples added
 > in the patch only show overriding the registry setting in the
 > configuration file, not an embedded registry within an image
 > string.

By 'default' I meant an image name that would be used without
specifying it on the command line with the -i option.  That's not the
same as the [DEFAULT] section in the TOML file.  But it's true it
could be clarified by mentioning an image name from a profile section
instead, so I'll reword this in the v2.

> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
> ---
>   Documentation/dev-tools/container.rst | 33 +++++++++++++++++++++++----
>   1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
> index 5dde95f6b222..3f2ba1fcf3bf 100644
> --- a/Documentation/dev-tools/container.rst
> +++ b/Documentation/dev-tools/container.rst
> @@ -48,6 +48,13 @@ Available options:
>       Profile section to use in the config file.  This will override any values
>       defined in the ``DEFAULT`` section.
>   
> +``-R, --registry REGISTRY``
> +
> +    Container registry name.
> +
> +    Any registry already included in the image name will be replaced or removed
> +    when using this option with no value.
> +
>   ``-r, --runtime RUNTIME``
>   
>       Container runtime name.  Supported runtimes: ``podman``, ``docker``.
> @@ -274,6 +281,15 @@ Supported options in each section are:
>       Name of the container image to use, equivalent to the ``-i`` command line
>       option.
>   
> +``registry``
> +
> +    Name of the container image registry to use, equivalent to the ``-R``
> +    command line option.  This will be used as a prefix before the image name
> +    with a ``/`` separator.
> +
> +    For example, a ``docker.io`` registry and a ``myuser/myimage`` image will
> +    result in ``docker.io/myuser/myimage`` as the full image path.
> +
>   ``runtime``
>   
>       Name of the container runtime, equivalent to the ``-r`` command line option.
> @@ -288,6 +304,7 @@ Here's a sample configuration with an extra ``clang`` profile::
>   
>     [DEFAULT]
>     runtime = "podman"
> +  registry = "docker.io"
>     image = "tuxmake/korg-gcc"
>   
>     [clang]
> @@ -306,10 +323,18 @@ Using the configuration file, it can now be simplified into this::
>   
>     scripts/container -p clang -- make defconfig
>   
> -Then to override the default user, the ``-u`` option can still be used::
> +Then to override the default runtime, the ``-r`` option can still be used::
> +
> +  scripts/container -p clang -r docker -- make defconfig
> +
> +Likewise, to override the registry name::
> +
> +  scripts/container -p clang -R my.registry.com -- make defconfig
> +
> +Or to not use any registry at all but only a local image::
>   
> -  scripts/container -p clang -u0 -- make defconfig
> +  scripts/container -p clang -R -- make defconfig
>   
> -This also illustrates how values take precedence over each other: the runtime
> +This also illustrates how values take precedence over each other: the registry
>   is loaded from the ``DEFAULT`` section, the image from the ``clang`` section
> -and the user ID from the command line ``-u`` option.
> +and the runtime from the command line ``-r`` option.

Sashiko wrote:

 > Does this explanation still match the example directly above it?
 >
 > The text explains that the registry is loaded from the DEFAULT
 > section and the runtime from the command line -r option. However,
 > the immediately preceding example is "scripts/container -p clang -R
 > -- make defconfig", where the registry is explicitly cleared and
 > there is no -r option used.

I see the issue, registry and runtime were swapped in the sentence.
This would be correct:

     This also illustrates how values take precedence over each other:
     the runtime is loaded from the ``DEFAULT`` section, the image
     from the ``clang`` section and the registry removed via the
     command line ``-R`` option.

I'll fix this in the v2 as well.


There were a couple of other comments already addressed in the first
patch about using hostnames rather than domain names, so nothing
further to add here about them.

And if anyone is wondering why it's useful to be able to override the
registry, a typical use case is when making modified images locally
before pushing them to a registry or when pulling images from a
development registry instead.  Say, in the TOML file a user can set
some standard images to be pulled from a public registry.  Then when
building a variant of an image, the user can just use the -R option
to pick it up instead of editing the file or duplicating profile
entries.  Validating the image names seems useful and it's a small
extra to be able to override the registry part once it's all parsed
into objects.  So it seems worth the extra few lines of code.

Guillaume
