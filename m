Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CAC4A3859;
	Fri,  4 Sep 2026 19:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549593; cv=none; b=LWt3rDmS9SgDiUOJC9MRaF2Sr4mR8mO65plrMdY4lstNLSln6WaIMkQ520/3NeFFC3Q+0DYUjSpEAbZjpKclfCsrzp5+0rwiQiKfGPkeyuA+FiCdoKepHBlRpzR7N9e3Kau2OrRPNvd/sHLH1BaqcJFaJtS36aDGG24ggLvwogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549593; c=relaxed/simple;
	bh=mz5R28uNnIWFGlQsYQ78S1ocY+93UGGXn1Zf85uYZ0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+Yd+igS6xnIejvRgVp2wrupbDlG9vH+IGNIEFdg5fTkcX/5PdHimaBooKepA5ILKW7T0lzAQhPUui2dmiJZA5Jdhu/OuMOOjwwZme/1pR/GMtX6kk3cH+5J4tYg0XeZVUW+c/IT7S4X+dmjd3w8fWPrKw0hZS72oaHWJ2Wr3k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=OrhVzU61; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="OrhVzU61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1788549584; bh=mz5R28uNnIWFGlQsYQ78S1ocY+93UGGXn1Zf85uYZ0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrhVzU61wsW6eMAkF14seAFAlX4NikPMwrFwzp7/q0aif/EZDVKOrXEfUPhTsDyFa
	 +kdKop9hprtpetO43lY1TQCro5xyBNTx1CPJwt2VVY51DtjoVwpjdAaFz3UFiDFhXg
	 ZwcTgAzXkCpzq+e9pz2d+YVTEWDmT0iQIPrKZkNtbg0VAjfWCG/vr8ofzbxDI1kEDK
	 5mtL8VYKJc+PFLsa8GYN2NEy5pGZIz5PmSnqNQWYYNzntFw6Q4+RCs8BRWr1+r9Ra6
	 q7GD9s/xUtLRfir4jtghM4atsKzj20phfgbSzcs+mDGDttoJMbocjvqbBxIsGdu9yp
	 zXvF7ZBxpkGUQ==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a9b19d0-2a57-7f0000032729-7f000001b004-1
	for <multiple-recipients>; Fri, 04 Sep 2026 21:19:44 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  4 Sep 2026 21:19:44 +0200 (CEST)
Date: Fri, 4 Sep 2026 21:19:43 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, kernelci@lists.linux.dev,
	automated-testing@lists.yoctoproject.org
Subject: Re: [PATCH RESEND v3 1/3] scripts: add TOML config to container tool
Message-ID: <20260904-invaluable-nifty-salmon-cf7767@l-nschier-aarch64>
References: <0a88d9d0ebd73a9f6e72399f93705ebc7b49ae9c.1788341513.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0a88d9d0ebd73a9f6e72399f93705ebc7b49ae9c.1788341513.git.gtucker@gtucker.io>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1788549584-FABC270C-BB7A4DCA/0/0
X-purgate-type: clean
X-purgate-size: 1513
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 6291CA0385  external: no

On Wed, Sep 02, 2026 at 11:33:00AM +0200, Guillaume Tucker wrote:
> Add support for a TOML configuration file to the scripts/container
> tool.  This improves user experience by not having to keep passing the
> same command line options all the time or overly relying on built-in
> default values.  Include the concept of 'profiles' with different
> named sections in the file to cover various use cases.
>=20
> Command line options take precedence over the config file, and values
> defined in profile sections take precedence over the default one.
>=20
> Add a -c option to override the location of the .container.toml config
> file which should otherwise be located in the current working
> directory.  If not found, the file is silently ignored as it is not
> strictly required unless the -c option is used.
>=20
> Add a -p option to choose a particular profile section in the config
> file rather than the default.
>=20
> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
> ---
>=20
> Notes:
>     Changes in v2:
>     - fix uid / gid handling when set to 0 (root)
>    =20
>     Changes in v3:
>     - fix logic when loading config profiles using None
>     - fix typo with missing whitespace in help message
>     - clarify how UID gets used as default value for GID
>=20
>  scripts/container | 89 ++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 77 insertions(+), 12 deletions(-)
>=20

Acked-by: Nicolas Schier <n.schier@fritz.com>

--=20
Nicolas
