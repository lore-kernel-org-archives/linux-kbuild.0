Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBA3612F8;
	Fri, 28 Aug 2026 17:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937932; cv=none; b=i2Tj9iee8dHl5Sa4mk7upSmJRX1a9VBp67PM3HJZ7VaVZ24k0FenY44DtWLkaKTX7M2xcHummy4/AlgzEjZbZP3JdVYm5N8TepBtLHO+Q02fGNcA1TZ1hy5KHmO9eQ2EsxYiwYpUXLsyLL6Xa0RKSOatUlpf8S6qcY9gtidwjjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937932; c=relaxed/simple;
	bh=9h+kkyizjGOo1hAHIURry7f4Fj+a3mszhRiFCil40hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YLCgkjfF7td69OhfJIuYne7+iHIj9hKvRHLQbyxM5IrZ88ywb8fq+SDV5KwdAFRhXHK/lgOvccGNni0BsrGBQjNQJ0/brs5+FPRxFrRxXIi7PSDNY2bxVC/WKrSkKFgauDAh+0rx0o4J6Z0kmZ1eYHI8kV+YnSKEpCEhAuN9QBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=mUHS34gM; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="mUHS34gM"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEF5A3E9B3;
	Fri, 28 Aug 2026 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787937921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eaRcPDZcNjV1l/Ap1KBPxTlFDbYfZalmHXVkpL7Z5mk=;
	b=mUHS34gMqT5xP7OJqbQZMfpoy5nNjy+Bdm1ReJn43fLzAgJ0LbcZ9ieEIyrWkUhCUBMVKL
	OTldA1OjDWAjNJAjsDcjHBjJ3y1nDubsDNcx8hfauxLoVOuYKLc+JTfW9lYlyt4e3/KgNH
	bh/a60VccmZsce1P22rLwIa9QzpfRABZwgts7N/LUpxcumSYAB4A9fJbdvQ4w9nUKoYXBO
	93XiLVjsHw0hOfVbIVwmHZdhnQ8axgAivHaKzV4IxcpfC7HggWEOayVeNbBjvTf67VqK4X
	aXOOcsR4iP/7hsz5qJH669s99ByHEXISUogDGfNGbaJ/IVHHNNAj8EL5a4ez+g==
Message-ID: <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
Date: Fri, 28 Aug 2026 19:25:18 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <apG3hwaPA8f7SJeI@levanger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: dmFkZTGAMKA7hbrIs1is+/ZVDRYgqHhjIEgcLLuku7GbhcldBQrUPSonRvkWbMeJhvw2zQ7oPJYohYKPnI5gqB5j4TsEs4dhVy2lgaqb2hDxXnw1p/jo2c0SyELWsW/JyT7jRpuqrwIEZZKbzHP1TeTKjOfonIG2ZtPwdBERb+wKkvecu1verH5BtJ2RhMaoN1vd64ay9pGxiI0guzZyk3Dg3TvFTzWLf3l7SJhDSFv23nRT4xRz5FWGXL3TEMFuXAjXUi3alRGAdTrQLR7Rx27OGcEfKeQwy08cJxVw+wLtIWJ4YCGeTCYNbNuvyfVGtbm9O5SuG6BTZt6nt5m6lRMLufzxO8tkOzywTFP3Si09LzWdx1aRZfJTmbeblu9OZsdupbG+ov40RJvBqTlKXKE3iSpRojiOXZhH9Tk8si7uuIzSPoh2uJZ9lGMVpoS6RH/mLVEbARy4ybT+9afIj05Rdz19aIqV9mUfPZdxwUzjgKUgqJJTcafrO2T7L2ExPKeZMkEJ6NSPcOu+/tUbUDIf+FcMDej5VAN7e27JM+suxVWkN+m/X3ELJcSXkNKbwtp/y9LZs9hMjSOYV8KrCdyGQWKtmo9R3TGJYBeTkWYl+WvbXs6+dXb167v0akpsJ5YRM1Coc+U16+DOUYwx2fJgJvc9HP/z7NDIxIyapemmHQ29TA
X-GND-State: clean
X-GND-Score: -100

Hi Nicolas,

On 28/08/2026 6:29 pm, Nicolas Schier wrote:
> On Mon, Aug 24, 2026 at 12:05:47PM +0200, Guillaume Tucker wrote:
>> Add support for a TOML configuration file to the scripts/container
>> tool.  This improves user experience by not having to keep passing the
>> same command line options all the time or overly relying on built-in
>> default values.  Include the concept of 'profiles' with different
>> named sections in the file to cover various use cases.
>>
>> Command line options take precedence over the config file, and values
>> defined in profile sections take precedence over the default one.
>>
>> Add a -c option to override the location of the .container.toml config
>> file which should otherwise be located in the current working
>> directory.  If not found, the file is silently ignored as it is not
>> strictly required unless the -c option is used.
>>
>> Add a -p option to choose a particular profile section in the config
>> file rather than the default.
>>
>> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
>> ---
>>   scripts/container | 81 ++++++++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 70 insertions(+), 11 deletions(-)
>>
>> diff --git a/scripts/container b/scripts/container
>> index b05333d8530b..cf126fa13510 100755
>> --- a/scripts/container
>> +++ b/scripts/container
>> @@ -1,17 +1,19 @@
>>   #!/usr/bin/env python3
>>   # SPDX-License-Identifier: GPL-2.0-only
>> -# Copyright (C) 2025 Guillaume Tucker
>> +# Copyright (C) 2025-2026 Guillaume Tucker
>>   
>>   """Containerized builds"""
>>   
>>   import abc
>>   import argparse
>> +import dataclasses
>>   import logging
>>   import os
>>   import pathlib
>>   import shutil
>>   import subprocess
>>   import sys
>> +import tomllib
> 
> Have you seen the comment from sashiko?
> 
> | Will this unconditional import of tomllib crash the script on startup for
> | users running supported Python versions like 3.9 and 3.10?
> | The kernel's baseline requirement allows Python 3.9.x, but tomllib is only
> | available starting in Python 3.11.
> 
> https://sashiko.dev/#/patchset/15e16f175f59ae666036764eb03c40cdf19809c7.1787896890.git.gtucker@gtucker.io

Yes, the minimum versions listed on this page are for building and
running the kernel:

   https://www.kernel.org/doc/html/latest/process/changes.html

It states Python 3.9 which was already older than the 3.10 minimum
set when the container tool was merged.  Also my understanding is
that it's not a hard requirement for all the kernel tools, only for
building and producing a functioning kernel.  If I misunderstood this
then I can rework the code to use .ini files until 3.11 becomes the
minimum.  However, looking at the whole tree:

$ vermin -v --no-make-paths-absolute $(git ls-files *.py) | grep -e 
"3.1[0-9]"
!2, 3.10     scripts/sbom/sbom/cmd_graph/deps_parser.py
!2, 3.10     scripts/sbom/sbom/spdx/build.py
!2, 3.10     scripts/sbom/sbom/spdx/core.py
!2, 3.10     scripts/sbom/sbom/spdx/simplelicensing.py
!2, 3.10     scripts/sbom/sbom/spdx/software.py
!2, 3.13     tools/lib/python/abi/abi_regex.py
!2, 3.10     tools/net/sunrpc/xdrgen/generators/__init__.py
!2, 3.10     tools/net/sunrpc/xdrgen/generators/program.py
!2, 3.10     tools/net/sunrpc/xdrgen/subcmds/source.py
!2, 3.10     tools/net/sunrpc/xdrgen/xdr_ast.py
!2, 3.10     tools/perf/scripts/python/mem-phys-addr.py
!2, 3.10     tools/power/cpupower/bindings/python/test_raw_pylibcpupower.py
!2, 3.13     tools/testing/kunit/kunit.py
!2, 3.11     tools/testing/selftests/drivers/net/hw/rss_flow_label.py
!2, 3.11     tools/testing/selftests/drivers/net/hw/rss_input_xfrm.py
!2, 3.10     tools/verification/rvgen/rvgen/dot2k.py


> (and there are some others...)

Some of the other comments are a bit bogus, the uid / gid precedence
logic is correct as far as I can tell.  It's a matter of convention,
maybe this should just be clarified a bit better in the documentation
(and we may add unit tests at some point...).  The comment about
injecting malicious runtime options via the configuration file seems
misled as the user should be able to trust the config file just like
the command line.  It's true that the image name itself could be
sanitised for extra safety anyway but that's not something introduced
by the config file.  I can do this as a follow-up I guess.

The comment about a missing whitespace is valid though, and the one
about profiles with integer values of 0 is valid too so I'll get them
fixed in a v3.

By the way, I wish we could choose to get Sashiko's review as an
email directly in the thread, do you know if this can be done easily?

Thanks,
Guillaume
