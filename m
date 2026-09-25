Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC8630EF6C;
	Fri, 25 Sep 2026 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366433; cv=none; b=UpBKe9+a6D1g3QVfyMuLL7lfoSFcj139HKyKlud73195zmCZijRvQYdbTel/Rm1FvGuQumL+yfs4Z4PH9ZdLnJaby3DEYnR67F0BToWnUXZdpmoLd7SCNy61IP0XBMsc21KvsAJiB03lgZdq7BcRmSlcDr/ImPclCV6GRrUVJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366433; c=relaxed/simple;
	bh=TZ/jYkQEQkYrb4voHmctluCqEH+VoM9eratR6lsHly8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=HwSI6ucQL0jdYQo5SjLtL7gFmTxjYMm7ynOX6i1ykqIkJR9onkejjvyyHCnaHljhC6fZ+eBjihF5LGTQrbiwPUciqgEln1zMSI523Ps1VhKwOI9LWMVWw3ElhL4LZZMsQiDkMElB5UihYZ2QrLnXGtYKxDazc3UzxoTxxVhTnyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0R04JBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0R04JBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62DF1F000FF;
	Fri, 25 Sep 2026 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790366431;
	bh=Bq/9Sjwl3fVjCD+ItDEtDoElofLtRAAjBrLkJknNdFQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=E0R04JBlyqh3KtOFH7YC7oJxFvyA4FzxHpr6BW2dkrfFmEYaSxNiu7lEuy3vXrfzi
	 f9tumIAdUJX4lH3fSjPfFK8qodZ67xKuA5Y6S9tuYtfREVX0aOXwwsEpIlzGPzUdIS
	 9tICWRxb91nS3P0+1OjYb/HQ3z5OfUtBIVEXQ2GdmgirOjG4GIQ5hhuMDJDT85al5X
	 lWCybM722YU4Yy8fC0e0BXTLUCWVDdHogrY9GtdxfHUa/QYRZfZNyBUShLnwN4D8WU
	 9ylxNlHvVW/+eMOiMjD5VxV2vQBZBEXg+zQHNDHMGvbaXAhhs0aYF2Pj91dxKvK3AO
	 PhvgDIUs2UPag==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] kconfig: tests: Reset KCONFIG_WARN_CHANGED_INPUT
 by default
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <arTSvcwLenaZwKm7@levanger>
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-1-286e5c985244@fritz.com>
 <a1efc002-c34b-43a4-be02-ff4746d13241@gmail.com>
 <arTSvcwLenaZwKm7@levanger>
Date: Fri, 25 Sep 2026 21:00:20 +0100
Message-Id: <179036642082.3653489.376583884931759728.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566; i=nathan@kernel.org;
 h=from:subject:message-id; bh=TZ/jYkQEQkYrb4voHmctluCqEH+VoM9eratR6lsHly8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnbLl0NvCz3l2H/Nc9nrIprGHJ1pj9KdN8d7HlvdtOdD
 I8dWyft7ChlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQAT2ZnO8L/sWt0OtdBZzE/a
 OgROHLtR5XEwzPD8dz7+eLOfFooRE8MY/so828+lyPF2Y0P3unkNezjez06/aKM2q01uzor9iQv
 tH3AAAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On 2026-09-24 09:35 +0200, Nicolas Schier wrote:
> On Sat, Sep 19, 2026 at 06:29:39PM +0100, Julian Braha wrote:
> > On 9/17/26 14:38, Nicolas Schier wrote:
> > > Reset KCONFIG_WARN_CHANGED_INPUT by default for all kconfig tests but
> > > those which set it explicitly.
> > >
> > > This fixes the 'warn_changed_input' test on systems with
> > > KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.
> > >
> > > Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
> > > Signed-off-by: Nicolas Schier <n.schier@fritz.com>
> > > ---
> > >  scripts/kconfig/tests/conftest.py | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
> > > index 66f95e4ed58c..e92f0cf1421a 100644
> > > --- a/scripts/kconfig/tests/conftest.py
> > > +++ b/scripts/kconfig/tests/conftest.py
> > > @@ -34,6 +34,9 @@ class Conf:
> > >          """
> > >          # the directory of the test being run
> > >          self._test_dir = os.path.dirname(str(request.fspath))
> > > +        self.default_env = {
> > > +            "KCONFIG_WARN_CHANGED_INPUT": "",
> > > +        }
> > >
> > >      # runners
> > >      def _run_conf(self, mode, dot_config=None, out_file='.config',
> > > @@ -57,6 +60,11 @@ class Conf:
> > >          # Override 'srctree' environment to make the test as the top directory
> > >          extra_env['srctree'] = self._test_dir
> > >
> > > +        # Set default environment variables, if not set by caller
> > > +        for var in self.default_env:
> > > +            if not var in extra_env:
> > > +                extra_env[var] = self.default_env[var]
> >
> > Maybe it makes more sense to have the tests ignore users' env vars if
> > they would cause tests to fail? For example, this recent patch
> > explicitly unsets the KCONFIG_WERROR flag:
> > https://lore.kernel.org/linux-kbuild/4d1eee3a-a5f9-467e-880e-4f2815851b09@gmail.com/T/#m25be9ad4d5e62956c5f98759398f91a555afb4df
>
> Good point, but I am not sure, if we really should ignore all of the
> user's environment.  Maybe it's better for now, to just reset all
> environment variables that start with KCONFIG_ and KBUILD_ ?

Given these are Kconfig tests, we could probaby just ignore KCONFIG_, I
don't see any instances of KBUILD_ within scripts/kconfig outside of the
Makefile. We could do both anyways and just adapt based on reports
though, I don't really have a strong opinion on that though.

-- 
Cheers,
Nathan

