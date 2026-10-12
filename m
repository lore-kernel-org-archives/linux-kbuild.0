Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E336B446052;
	Mon, 12 Oct 2026 21:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841791; cv=none; b=GSyM8GPzRGrwa3AwpVjwjkaphc863X09RGEw6Usi0++pwYT1nZ0dPRgQNYUFF6a1zQVX/Rj9YjHTb5JDZG1IImZgNAiZ5JoOCKlQVCHogVfdkWE7L4cacmKVd2En9BzbTk5BF7caso9VYNWqoOTE33hucbwQSB3CR3oa2oa0Wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841791; c=relaxed/simple;
	bh=hnVhe38CDSCQMuLaq+rOuhHGr1S9wuqf0QoqPhGkhaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9JPuwtOqAM5KCj+m9NeWJFXBoSLOXf3L15V4hK8cUnyTlnz66ftUGegjNf8PduoaEgfPqHOeUWVc5ZZJKnbDzTNWtfP12NMVnb9y2kSN95ygd+E0XqIy8J8RimIY78xK+ACHW4E6AR+PNKeWpU88RomttNCbhHJ1MplBdO9sYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=anZ0d/wb; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="anZ0d/wb"
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id F00FE5801DC;
	Mon, 12 Oct 2026 21:31:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A14183F64A;
	Mon, 12 Oct 2026 21:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1791840684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkr5kUgTqT/tfVa4kWKs3sHgq0KJ6SU6vOlkZ6GvZK8=;
	b=anZ0d/wbm9+uU4SLYlG5Bd0WuY5gTZ4kUNpRefQDCmdQiO/1R5tVwBqmxkiLIPeKqXJZAu
	aa0mCIb6X1RSZpz0RuVom+Flfm/GuIjeN48tCBAtvsdlSnbaltLWJ1VG2EAtX6ea8TAXk7
	ija9XYiDeYKzu7nSt+CPU4kaf4owGbDf4MBeq9vl5WbGcXe0Q4evji66I8y04YM4SZDgDD
	/X7Ijb6+aBdRDFjRV4fTNbxYQBE8xXv5aZg9fT7hJCYNHFFNCktVjB35DcxkNm9idwSjRA
	TnoWH6uprRL3PXsliNy7E9FmCR+VtC/Nc89PojV7rscA0aJESzw+tjcqxBeKKA==
Message-ID: <d8a73b5f-ef08-479e-8c72-d8d81e680280@gtucker.io>
Date: Mon, 12 Oct 2026 23:31:21 +0200
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
X-GND-Cause: dmFkZTEA8c7a6DjZY0mdwmyP2U31U8frA5C/TIDWZQpU0KpeyJhfOzVkLxYqVMbpwxICWmu7nXQGo+SrchSNcDhE58NYohNN59SwuFF+b6U8NrMFDsP+ZmogYWaQHvZneJcTqy24ci7oHn2S5a9/rBcmamWWpExu0hAH+KpMAiH7bFJx+XjLiMglKJ7YDeq/HQRnIEOQ6y4eDMrdrw+eNEtOX7lEHHlNxeWBF998aummeg0PG0TlqMcOJjbC21KFgbnyYFipKM4ur/xOpg3folcOnGNDl/y3U5ZiVx7599EGLHlxno/1UczTWbtyzqiSJTX8y0IATeqBdgQy3JkbS4ewf0VLIPRfrAaBQxnskyzd+/wSxSF4DXHfXPu8JnMQSf06L28DV8K0L7PnkFY6v2MmzQw27AfyE+F6OcQwMHo4cciDo/yXOnvwri6QIGXTC6/BlwsrtpfrKiphzqJ10UUukk5sw8TJjeb38gDziffgUkchs4ioObpK94LXXxqk32YoM65xRoGxDksZRMEaDenc+0L+5JPHStI+Geg6hcRai2M34zGuiwHm5f9WdkRwdZJIrPxj5LuQ6RvSVd3+a2HNPndIsz3mPVNikv0bttNg4ffdH+E28DVg0HJnejmRDewW3/wVUmVXLfau+qgPm3ddgMxbJ98HAZdYj/3q/94bshEnMw
X-GND-State: clean
X-GND-Score: -100

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
> @@ -10,6 +10,7 @@ import dataclasses
>   import logging
>   import os
>   import pathlib
> +import re
>   import shutil
>   import subprocess
>   import sys
> @@ -17,6 +18,89 @@ import tomllib
>   import uuid
>   
>   
> +def _init_registry_regex():
> +    domain = r'[{anum}][{anum}-]*\.[{anum}\.-]*[{anum}]'.format(anum=r'a-z0-9')

Sashiko wrote:

 > Does this hardcoded requirement for a literal dot in the domain
 > regex prevent the use of single-component hosts like localhost?

That's fair enough, a plain host can be used as long as a port number
is also provided.  So localhost/image wouldn't work as it would be
considered part of the image path, but localhost:5000/image is valid.
I'll fix this in a v2.

> +    ipv6 = r'\[[a-fA-F0-9\:]+\]'
> +    port = r'[\d]{1,5}'
> +    return rf'((?P<domain>{domain})|(?P<ipv6>{ipv6}))(\:(?P<port>{port}))?'
> +
> +
> +def _init_image_regex():
> +    step = r'([{anum}]|[{anum}][a-z0-9_\.\-]*[{anum}])'.format(anum=r'a-z0-9')
> +    tag = r'[a-zA-Z0-9_][a-zA-Z0-9_\.\-\/]{0,127}'
> +    return rf'(?P<path>{step}(\/{step})*)(\:(?P<tag>{tag}))?'
> +
> +
> +REGISTRY_REGEX = _init_registry_regex()
> +IMAGE_REGEX = _init_image_regex()
> +
> +
> +class ImageParserMixin:
> +    """Helper mixin to parse container image names"""
> +
> +    @classmethod
> +    def from_fields(cls, fields):
> +        """Get an object using a valid subset of fields or None"""
> +        kwargs = {}
> +        for field in dataclasses.fields(cls):
> +            if value := fields.get(field.name):
> +                kwargs[field.name] = value
> +        return cls(**kwargs) if kwargs else None
> +
> +    @classmethod
> +    def from_name(cls, name):
> +        """Get an object using fields in the name matching ._regex or None"""
> +        re_match = cls._regex.match(name)
> +        return cls.from_fields(re_match.groupdict()) if re_match else None
> +
> +
> +@dataclasses.dataclass
> +class RegistryName(ImageParserMixin):
> +    """Parsed container registry name with no image"""
> +    registry: str = None
> +    domain: str = None
> +    ipv6: str = None
> +    port: str = None
> +    _regex = re.compile(rf'^(?P<registry>{REGISTRY_REGEX})$')
> +
> +
> +@dataclasses.dataclass
> +class ImageName(ImageParserMixin):
> +    """Parsed container image name with no registry"""
> +    image: str = None
> +    path: str = None
> +    tag: str = None
> +    _regex = re.compile(rf'^(?P<image>{IMAGE_REGEX})$')
> +
> +
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

Sashiko wrote:

 > Could this result in an AttributeError if self.image is None when
 > accessing self.image.image?

In theory that's true, but the whole point is to initialise the class
using the regex parsing mechanism and when doing this, the field
would never be None.  If it failed to parse the FullImageName object
wouldn't be constructed at all when using .from_name().  So an
exception if .image was None would seem justified - or even an
assert.

> +    @classmethod
> +    def from_name(cls, name):
> +        if re_match := cls._regex.match(name):
> +            fields = re_match.groupdict()
> +            return FullImageName(
> +                registry=RegistryName.from_fields(fields),
> +                image=ImageName.from_fields(fields),
> +            )
> +        return None
Sashiko wrote:

 > If the user provides an image name with a trailing slash like
 > registry.com/, does the optional image capture group match nothing?

Ah yes, but that's a small bug in the regex due to the trailing '?'
which makes the image optional when it shouldn't.  I'll fix this in a
v2 - and I guess it might explain the previous comment as if the
image part is not optional then .image should never be None.

> +
>   class ContainerRuntime(abc.ABC):
>       """Base class for a container runtime implementation"""
>   
> @@ -145,6 +229,7 @@ class Config:
>       """Container configuration"""
>       image: str = None
>       runtime: str = None
> +    registry: str = None
>       env_file: str = None
>       uid: int = None
>       gid: int = None
> @@ -188,23 +273,40 @@ def _get_logger(verbose):
>       return logger
>   
>   
> +def _get_image(args, config):
> +    image_name = args.image or config.image
> +    if not image_name:
> +        raise ValueError("no image specified")
> +    image = FullImageName.from_name(image_name)
> +    if image is None:
> +        raise ValueError(f"invalid image name: {image_name}")
> +    if args.registry == '':
> +        image.registry = None
> +    elif args.registry is not None:
> +        image.registry = RegistryName.from_name(args.registry)
> +        if image.registry is None:
> +            raise ValueError(f"invalid registry name: {args.registry}")
> +    elif config.registry is not None and image.registry is None:
> +        image.registry = RegistryName.from_name(config.registry)
> +        if image.registry is None:
> +            raise ValueError(f"invalid registry name: {config.registry}")
> +    return image
> +
> +
>   def main(args):
>       """Main entry point for the container tool"""
>       logger = _get_logger(args.verbose)
>       try:
>           config = Config.from_toml(args.config_file, args.config_profile)
> -        runtime = args.runtime or config.runtime
> -        cls = Runtimes.get(runtime) if runtime else Runtimes.find()
> +        runtime_name = args.runtime or config.runtime
> +        cls = Runtimes.get(runtime_name) if runtime_name else Runtimes.find()
> +        logger.debug("runtime: %s", cls.name)
> +        image = _get_image(args, config)
> +        logger.debug("image: %s", image.name)
>       except ValueError as ex:
>           logger.error(ex)
>           return 1
> -    logger.debug("runtime: %s", cls.name)
> -    image = args.image or config.image
> -    if not image:
> -        logger.error("no image specified")
> -        return 1
> -    logger.debug("image: %s", image)
> -    return cls(args, config, logger).run(image, args.cmd)
> +    return cls(args, config, logger).run(image.name, args.cmd)
>   
>   
>   if __name__ == '__main__':
> @@ -235,6 +337,12 @@ if __name__ == '__main__':
>           help="Profile section to use in the config file.  This will override "
>           "any values defined in the DEFAULT section."
>       )
> +    parser.add_argument(
> +        '-R', '--registry', nargs='?', const='',
> +        help="Container registry name.  Any registry already included in the "
> +        "image name will be replaced or removed when using this option with "
> +        "no value."
> +    )
>       parser.add_argument(
>           '-r', '--runtime', choices=Runtimes.get_names(),
>           help="Container runtime name.  If not specified, the first one found "

The rest of this patch appears to be Shashiko-friendly, at least in
this iteration.  I'm updating the unit tests accordingly and will
send them in an RFC alongside the v2.

Guillaume
