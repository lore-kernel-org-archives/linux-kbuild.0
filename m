Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF96442399;
	Wed,  2 Sep 2026 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344803; cv=none; b=bGXr7LeioKXDjc4snIkzVk7ZkYfCPuxO03u022To+KEU07uevjBl0doWcdhLPdubjpMtYWEPDVXo1k+6sbcNPc1JpQDmRLZ8vb1aJM8PtTTSPcf7mxOYzJ1QChZbPJ35dP3jPycrqzi+giRKcTKMH6HsGoLBgz2Mj+vGzGgppI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344803; c=relaxed/simple;
	bh=7Fmyr0br0Pw2O/ShA7nOmC9TvroEISadr6n61UmEvXk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=XLNwAuzuAPwA3YtgjqJoj838Cx90pDceuKDf8zmd9C0HhL72zLtU7EYkOIu+ZI9whakj2A18zNPU20M9nqXR+2iuZ4lzhaO/aammFHVakauF4C3F/Cpyoz0UuN0VeK+T/C2YIFrUE9LuXG0itFPlyg0lEjpT1rpRCa+6wG4pZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Heg/RVhX; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Heg/RVhX"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDA6F3E97B;
	Wed,  2 Sep 2026 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788344791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRogZaXeJI0sxRVtwh4Rv+azq6CPVOmAmr30OdYFC9E=;
	b=Heg/RVhX5agzsVUibGoaePBiscY7viq6SMgqIwtnygcCja3++IqwlYrENqzIg6Rvvk+zuh
	r4EbQ1CG+ENad1w4DGXW3l/B42NjvIZovXmTfLl7ZskENX110NZb8O+X1Jz/+jNUBBnlhg
	0XEs/OITwYPH+SRmnwiecH3vRvkaIKRm9riOcL66GpkmIy/rqol6Cn5Ote26fpVEhtqSMm
	07PpKskVtLiwY5vwLkqvWVP81caVnAqL44E64A7mRlIzy6alNFFMa3DT/iNTGEhUoHfDG7
	e2TN/LN0w7jKSFf1xnD9LhLf7DAk8CHY23Mm+KFqtoLS7KnX+aoHOqvkEDLk6Q==
Message-ID: <ed43b869-6fd4-4b00-8fd2-e9dd9aaf3349@gtucker.io>
Date: Wed, 2 Sep 2026 12:26:29 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
Content-Language: en-GB
Cc: linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Organization: gtucker.io
In-Reply-To: <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: dmFkZTEOOtMFYOFpbE3Q1NhkMev0AJHp+c1ZkolRqLgUvK5r9Zdqv2ZD6JyCciA8IAcaoMxmMHLOt0UxEYzuMXDKcuUFpFG4T/tYwAzgRc7aK+Kkf9YgcMeywzGjY2FnIPxsC6dyCz/OqB6BdeOc5ILFgaxy0WvyRACEKYBOJVlALfDRGQV6b2ZoRGUeUky+Xj0s6xTFDZ5SfKgqrzLO13fNS7xxyK/a03D2zlfEVYFY8px7Wa9HaYk/fOrS2XqKmBq1YgFNotgeiJ6thcrJqWmea8+zT9sU6SqdFkjRb/inGLw0Y8d5wXkDKXFqMgOdifSMjtr8Y+KiGiIIge3yiHRD2CI/X+Nf52QwGZDKX+89NBgJJSOOo4W6ZJBiykTvFmpgOC9T51Qb7NmDKvJaVwbuAagc2JeI/IwHLEScbx0wCHlektDNPz2mR5yC2THhwu0Smpq1bqcttloL/2D8uydqaPa0u/j+8xFZx7feng7LhjsHSaFRL822+pagLanTev2XBj9K+0XrSo5mlka9B3Q7y+75ren0TZ8KWOqkYS25PzRQDF7afdCsk0QpCdINBtuFgdZHZ7c+cdhrdVJLpGsBPeHgMw+ofV/cg/jwkRFeQXgNCey31UH9EoSWLKKt31N4MosFe388AM95v0T1pAx3eEGiDDBEfDJhK7fldAfnZlhrkw
X-GND-State: clean
X-GND-Score: -100

On 28/08/2026 19:25, Guillaume Tucker wrote:
> Hi Nicolas,
> 
> On 28/08/2026 6:29 pm, Nicolas Schier wrote:
>> On Mon, Aug 24, 2026 at 12:05:47PM +0200, Guillaume Tucker wrote:

[...]

>>> +import tomllib
>>
>> Have you seen the comment from sashiko?
>>
>> | Will this unconditional import of tomllib crash the script on startup for
>> | users running supported Python versions like 3.9 and 3.10?
>> | The kernel's baseline requirement allows Python 3.9.x, but tomllib is only
>> | available starting in Python 3.11.
>>
>> https://sashiko.dev/#/patchset/15e16f175f59ae666036764eb03c40cdf19809c7.1787896890.git.gtucker@gtucker.io

Here's the latest Sashiko review from the v3:

  https://sashiko.dev/#/patchset/0a88d9d0ebd73a9f6e72399f93705ebc7b49ae9c.1788341513.git.gtucker%40gtucker.io

The bump to Python 3.10 is being kept as discussed earlier with
Miguel and others.

>> (and there are some others...)
> 
> Some of the other comments are a bit bogus, the uid / gid precedence
> logic is correct as far as I can tell.  It's a matter of convention,
> maybe this should just be clarified a bit better in the documentation
> (and we may add unit tests at some point...).  The comment about
> injecting malicious runtime options via the configuration file seems
> misled as the user should be able to trust the config file just like
> the command line.  It's true that the image name itself could be
> sanitised for extra safety anyway but that's not something introduced
> by the config file.  I can do this as a follow-up I guess.
> 
> The comment about a missing whitespace is valid though, and the one
> about profiles with integer values of 0 is valid too so I'll get them
> fixed in a v3.

The comments about UID and GID have been addressed as well as minor
typos with missing whitespace etc.

The issue about container image name validation will be addressed as
a follow-up since it's not introduced by this series.  I've prepared
some changes with a compliant regex to send on top already but it's
quite invasive so I thought it'd be best to get this first series
done first.

There's a new comment which seems fair enough although that's also
partly a matter of CLI options interpretation:

| Since there is no --registry command line argument to override or unset the
| configuration value, a default registry in .container.toml (like docker.io)
| will be blindly prepended to fully-qualified images provided via the -i
| option (e.g., quay.io/lib/img).
|
| This results in invalid image paths like docker.io/quay.io/lib/img and
| prevents the use of images from other registries via the command line. This
| appears to contradict the documentation's claim that command line options take
| precedence over configuration values.

I can definitely take this into account as part of the image
validation rework since it'll also be able to parse the registry part
of a fully-qualified image name.  If the registry config option is
currently seen as ambiguous, I can just drop it from this series and
consider adding it with a more robust implementation then.

There's also a new comment about handling TypeError exceptions when a
TOML config value has an invalid type (e.g. string instead of int).
This isn't really a blocker IMHO but can be handled to improve user
experience.  In fact I'd consider improving error handling overall
and factor-in an earlier comment about when no runtime is found
automatically and a more useful message could be provided.


So to recap, here's what I would suggest:

* keep Python 3.10 for this series, continue discussion about minimum
  and optional version numbers tree-wide in other threads

* drop registry config file option in v4 then add it in a follow-up
  series along with image name validation and parsing using regex

* leave TypeError exceptions as-is in this series, improve user
  experience and error handling altogether in another follow-up

Best wishes,
Guillaume

