Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B093382FC;
	Thu, 24 Sep 2026 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235346; cv=none; b=OU4ZFmnvzays1pturjGDIHQgZZ1bqhaATDXivPKtltjbpCbhwIM/582KVF366VM0ZhRJd9M9B4SLJ08gCr++XjwPFGk//RJiaydkP+F7KbeLh23Cd80yUxO93QwP8dswTH26Ntsbn9SMmDHGtq+uxwfbsVcIyH/ytG3OgSxPwOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235346; c=relaxed/simple;
	bh=l0a1ZOrqXaZBb2gpDB/NaEJiiaa3JIe6r7e0fcOIHm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8bkg2haoMU6rz8DOXK2+qUsLHk1CUYpSzFZkO6xXP9ADmdL5Tjz4hnZXzzWjGurrNnRHHfRnlR3UfgeG1emc4S9OtTbrt7Q9dejsTJai8eXFZ0WfcZg4E5g8YJnQDlA0kJV+4auBlm75OLeGaERjjem0fERb7hPdw07zAdnGk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCNbWmjq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCNbWmjq"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C90F01F000FF;
	Thu, 24 Sep 2026 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790235343;
	bh=1DjE0br+Zpw8GpmXTJxpWJ7DiUr3l3oC8QPxkD5V81w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RCNbWmjqW6gGvO/y4IO9lJOwe8Wzt/OcNzq3yzJHIPn/H+9P5+6/uYcbZ7EIIdrW/
	 C+//oRCCly/4Ek28rsapIaE9rD9JQxBQhbpvp1lXOxAyDkgBGDR8RGce3lYnNX0Ihn
	 43j9SZd7DppizuVTNdiCrfcP62nKHORPD9tD0JgpnhPppEQDEuwmc3gi6r3SCJIX1z
	 89Ri4yH5XgG5agTYIgpB7WCw/vHwlc5dbv/dHf0DSQsBzt9/RKWT5zxGHqVIa2GmbN
	 9yVL5dePMy83j7XLY5kExYYmd09/fDV4Z6fQKhO2HC6+YilvCvPHGFPUJ2Sw47C+kv
	 cOBZ9FEi1tc7w==
Date: Thu, 24 Sep 2026 09:35:25 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ulf Magnusson <ulfalizer@gmail.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] kconfig: tests: Reset KCONFIG_WARN_CHANGED_INPUT by
 default
Message-ID: <arTSvcwLenaZwKm7@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ulf Magnusson <ulfalizer@gmail.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-1-286e5c985244@fritz.com>
 <a1efc002-c34b-43a4-be02-ff4746d13241@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1efc002-c34b-43a4-be02-ff4746d13241@gmail.com>

On Sat, Sep 19, 2026 at 06:29:39PM +0100, Julian Braha wrote:
> On 9/17/26 14:38, Nicolas Schier wrote:
> > Reset KCONFIG_WARN_CHANGED_INPUT by default for all kconfig tests but
> > those which set it explicitly.
> > 
> > This fixes the 'warn_changed_input' test on systems with
> > KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.
> > 
> > Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
> > Signed-off-by: Nicolas Schier <n.schier@fritz.com>
> > ---
> >  scripts/kconfig/tests/conftest.py | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
> > index 66f95e4ed58c..e92f0cf1421a 100644
> > --- a/scripts/kconfig/tests/conftest.py
> > +++ b/scripts/kconfig/tests/conftest.py
> > @@ -34,6 +34,9 @@ class Conf:
> >          """
> >          # the directory of the test being run
> >          self._test_dir = os.path.dirname(str(request.fspath))
> > +        self.default_env = {
> > +            "KCONFIG_WARN_CHANGED_INPUT": "",
> > +        }
> >  
> >      # runners
> >      def _run_conf(self, mode, dot_config=None, out_file='.config',
> > @@ -57,6 +60,11 @@ class Conf:
> >          # Override 'srctree' environment to make the test as the top directory
> >          extra_env['srctree'] = self._test_dir
> >  
> > +        # Set default environment variables, if not set by caller
> > +        for var in self.default_env:
> > +            if not var in extra_env:
> > +                extra_env[var] = self.default_env[var]
> 
> Maybe it makes more sense to have the tests ignore users' env vars if
> they would cause tests to fail? For example, this recent patch
> explicitly unsets the KCONFIG_WERROR flag:
> https://lore.kernel.org/linux-kbuild/4d1eee3a-a5f9-467e-880e-4f2815851b09@gmail.com/T/#m25be9ad4d5e62956c5f98759398f91a555afb4df

Good point, but I am not sure, if we really should ignore all of the
user's environment.  Maybe it's better for now, to just reset all
environment variables that start with KCONFIG_ and KBUILD_ ?


-- 
Nicolas
