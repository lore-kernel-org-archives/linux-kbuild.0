Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1F356762;
	Fri, 28 Aug 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934715; cv=none; b=FaFHKEha2amAY87S0wocyQxORqSTHIyh3o2l3eMI43iN2gN/b2gHX4daHsHfG9GY0+fJyDIH69YxsnmiZVEq1LaQtblhTCpwni6L3kJYVr7stGRXWdOCkQ/o15/kEkA5XIszBvajvtZ95SK6nsejKo8fDBs+mY2lzQtJpWYechE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934715; c=relaxed/simple;
	bh=tZAVh7iklzrVSgPGqOQ2vf31SbGCxykG+S4u9K295CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZlo3uqzlcZazUaUb5H7srL4lzLHsRz76OnxrFwX5xyalsRgtr/lEv+UlsVz5WlZMl2BD1m4lzO8JKp7qKGrezb47gJaUMdpilmP1x8p9yOAxLVBlm0rP8P/SKxtgnWeG+HREZAaNbkEyMAt9q3nd9/C/aurLYvo9SQAQsUaDC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+KF0W42; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+KF0W42"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 033981F000E9;
	Fri, 28 Aug 2026 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787934712;
	bh=qRbv7Iotgu8TM7xKcVQJYpmOHvnV1/RtebAv6ea6LIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B+KF0W42pX6Verd/7U0Qj6mtdoe21iZo/dgqJoOCuA16OLkvUsLoH5e+TQHOx0sMF
	 lSQFQV7lll9D1p5TXm3yDnCzIK7VbMjIav/dZMh1g4I9GnnLtSt5zjpRG8oa9CiQXA
	 4t08xZ/2TAGBVTbU0cR+Y6E3HABhQwci3RT3J4/ocZekMUk+ROJt4qGhLtiQoHywX2
	 H03DDD/ttz0hfp4f6uyGpOBDjBT3ZG5dj3FaSHcy/IvIhvzr9pMjYi6vKHnE6rOxQP
	 PWa7VM82/WOTf6YQaU2T+umtrCw7sT4hJEaciUB1E97ngvqc7DhUIHR5JaT+34is6g
	 glf8oeFFJn67g==
Date: Fri, 28 Aug 2026 18:29:59 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
Message-ID: <apG3hwaPA8f7SJeI@levanger>
Mail-Followup-To: Guillaume Tucker <gtucker@gtucker.io>,
	Nathan Chancellor <nathan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>

On Mon, Aug 24, 2026 at 12:05:47PM +0200, Guillaume Tucker wrote:
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
> ---
>  scripts/container | 81 ++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 70 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/container b/scripts/container
> index b05333d8530b..cf126fa13510 100755
> --- a/scripts/container
> +++ b/scripts/container
> @@ -1,17 +1,19 @@
>  #!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0-only
> -# Copyright (C) 2025 Guillaume Tucker
> +# Copyright (C) 2025-2026 Guillaume Tucker
>  
>  """Containerized builds"""
>  
>  import abc
>  import argparse
> +import dataclasses
>  import logging
>  import os
>  import pathlib
>  import shutil
>  import subprocess
>  import sys
> +import tomllib

Have you seen the comment from sashiko?

| Will this unconditional import of tomllib crash the script on startup for
| users running supported Python versions like 3.9 and 3.10?
| The kernel's baseline requirement allows Python 3.9.x, but tomllib is only
| available starting in Python 3.11.

https://sashiko.dev/#/patchset/15e16f175f59ae666036764eb03c40cdf19809c7.1787896890.git.gtucker@gtucker.io

(and there are some others...)

Kind regards,
Nicolas
