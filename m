Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914142981E;
	Thu, 24 Sep 2026 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238734; cv=none; b=bRmxN1skLLHg4J5jwakg9zLyr+daGB/1eIs+BmWjDQ3PULFziO5UoWjxTxJjtn8X/PrF2u8yUAB5V398H51kas4p7LpRUZzeAm7sSqdlkz6dFJ8dj8+6ZrN4JE66RcJxEoMDtbZka09IxOHSKdvZNeUzsB5ttFUbvlwDrFJmm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238734; c=relaxed/simple;
	bh=Z3w08f8Z2mDt9tb5wx7ZjGKpoBslSL4wZDJkvLJPoto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhslR3g483NSPTZzH1J9z8LACWY4+z71yY/gS2wLLyKC6lNBhPb9UbZQCxuvWgoPs/0XY1UVK0Lht10mx+MqbFZdmXCjX1lbciPUEmdos1hcGCKlDSpt6Jy3wFHuuQW/qAsnYgvzxAIaQ0pSTCzMb7HAUmUYdLpChlHJGQL2dlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=h7YxJaJ1; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="h7YxJaJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790238714; bh=Z3w08f8Z2mDt9tb5wx7ZjGKpoBslSL4wZDJkvLJPoto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7YxJaJ1vBCRKBKegBy39h+ktsqSDoKB+FSeSyrgYBotAt95Hfn1M6BOZ6GnSyzn/
	 VeZ9NzMxt7c3DAQUdYhm98HwMqeZOEZsV+4/3H5V3AtIHx4apJeG5fvrrc3O/qW7Hy
	 qhlJthF/0g6ARmd0jS9fuVkgjDsi8dYxqEdKGOhpoWzfZZOu2QCNV8hRkrz7h221M8
	 9GNn8ea2Lza1eqB8GGSwqcDMv62zXB4+yLKcZam2r2NDsQdmljxFPOjXBU8ueeWvax
	 0pnX8TIZ9VTFo57TNOMoJB0D7xh1berky/eDPNrb92SUINGOqNOWzZNnE7QQjqHNpl
	 sSeo99X1mvPpg==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab4dffa-03cd-7f0000032729-7f000001cfdc-1
	for <multiple-recipients>; Thu, 24 Sep 2026 10:31:54 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 10:31:54 +0200 (CEST)
Date: Thu, 24 Sep 2026 10:31:44 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ulf Magnusson <ulfalizer@gmail.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] kconfig: tests: Provide defconfig outfile for
 savedefconfig
Message-ID: <20260924-unselfish-loose-skylark-a7fdbf@l-nschier-z2>
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-2-286e5c985244@fritz.com>
 <ef365f19-afd2-4704-b900-847b24540a30@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef365f19-afd2-4704-b900-847b24540a30@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1790238714-1E7BAEE1-8FEC6898/0/0
X-purgate-type: clean
X-purgate-size: 2026
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 2D756A0168  external: no

On Sat, Sep 19, 2026 at 06:45:33PM +0100, Julian Braha wrote:
> On 9/17/26 14:38, Nicolas Schier wrote:
> > Let kconfig test framework's 'savedefconfig' forward the requested
> > output 'defconfig' filename to 'conf'.
> > 
> > The original implementation was calling 'conf' with '--savedefconfig'
> > but missed the mandatory filename for the defconfig output file.
> > 
> > While at it, honour the 'dot_config' argument which points to the input
> > config file.
> > 
> > Fixes: 022a4bf6b59d ("kconfig: tests: add framework for Kconfig unit testing")
> > Signed-off-by: Nicolas Schier <n.schier@fritz.com>
> 
> Reviewed-by: Julian Braha <julianbraha@gmail.com>

thanks.

> 
> > ---
> >  scripts/kconfig/tests/conftest.py | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
> > index e92f0cf1421a..f2ad2ac2a661 100644
> > --- a/scripts/kconfig/tests/conftest.py
> > +++ b/scripts/kconfig/tests/conftest.py
> > @@ -240,7 +240,8 @@ class Conf:
> >          dot_config: .config file for input
> >          returncode: exit status of the Kconfig executable
> >          """
> > -        return self._run_conf('--savedefconfig', out_file='defconfig')
> > +        return self._run_conf('--savedefconfig={}'.format(out_file),
> > +                              dot_config=dot_config, out_file='defconfig')
> >  
> >      def listnewconfig(self, dot_config=None):
> >          """Run listnewconfig.
> > 
> 
> Nice catch!
> 
> <nitpick> out_file here isn't actually defined until later, in patch 4.
> But it seems this won't actually break anything if applied alone since
> this savedefconfig function currently isn't called anywhere (until your
> patch 4).

Ah, yes.  I'll update the argument of 'savedefconfig':

-    def savedefconfig(self, dot_config):
+    def savedefconfig(self, dot_config, out_file='defconfig'):

Then out_file is properly defined.  Thanks!

-- 
Nicolas
