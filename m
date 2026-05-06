Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82BF3EF0B7;
	Wed,  6 May 2026 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778092580; cv=none; b=pMEoFngc6inTDZdpeqfv6+XmYzGUlcGcFm+jF9AkHn7c8yV31IxYd5NY8tQXIv9sT3F8pKqH7cnxR8v7gtl2Mh9B23KoMqXKebtfI0zimALZ0E9W/9R7vDVNC1XwDS+EX9fZ/oqefj7D0yCNy5qhWlhQswaVLIQt+Gv7QkOITOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778092580; c=relaxed/simple;
	bh=XOXxHWFlTNbJ1/at/c8ZUj7Oz1JN6TdykBvgbQZx/0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsydUbrfJvF6AxmFnMGXe+HLtfoN4hxUv2ns8BMDsBVNzFkQERBS5raOgxXFOrdoi/MJhvCLRxb+z3yRhe9F9mI43054Yy7KD1YzRIYGMWBbPCsy/1cDFnXhW2ZQbfW1Vnj6yNEdEzQF+ICwmHYResvkw1s3fwXm6QW5KV8fTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFCnwA6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFCnwA6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0E0C2BCB0;
	Wed,  6 May 2026 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778092580;
	bh=XOXxHWFlTNbJ1/at/c8ZUj7Oz1JN6TdykBvgbQZx/0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFCnwA6uRNqzQcGDev9HPKPehHbkGYdieIB1CEV2ipSjsJGUnDD2Ox+frO/9fey6G
	 ac+N+hFUmflQ4xuv7fDwJhwdzAfrzs+G6RkGxQcFoe1BN51wGn5C5eUajNIq4Nesyo
	 TVj93fxPzc6iZ6+0iwA3taWkkrXF3ub0kwmOl2CJQy8WKaawqaBIR6cJJ/i2jlDGQH
	 lKR4G1p9itxhvXFzP2Lm/y+w0KuHx75Hqo1lADD6knddJlNIVf6f2/i4UtuvtPcbK5
	 ZnOQ13VSggakTfGrVy/vdHSqvdnGcdDnBD5Ya890GouQhH6eEOnBspMnJgH6b5IZXw
	 PtKBc5Vyzdqhg==
Date: Wed, 6 May 2026 13:36:18 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Test User <test@example.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: add self-test fixtures for style
 checker
Message-ID: <20260506183618.GB2178335-robh@kernel.org>
References: <cover.1777471439.git.daniel@makrotopia.org>
 <4b913d4e903c56ac479a4f3715159d63ea5cdcea.1777471439.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b913d4e903c56ac479a4f3715159d63ea5cdcea.1777471439.git.daniel@makrotopia.org>

On Wed, Apr 29, 2026 at 03:21:39PM +0100, Daniel Golle wrote:
> Provide good/ and bad/ DTS and YAML fixtures plus a small runner that
> feeds them to dt-check-style and diffs the output against expected
> text files. Wired into a new top-level dt_style_selftest make target
> so the suite can be exercised independently of the full tree.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Changes since v1:
>  - new patch (Krzysztof: "would be happy to see at least a few test
>    cases for it")
> 
>  Makefile                                      |  6 ++
>  .../dtc/dt-style-selftest/bad/dts-spaces.dts  | 13 ++++
>  .../bad/yaml-child-addr-order.yaml            | 41 ++++++++++++
>  .../bad/yaml-child-name-order.yaml            | 37 ++++++++++
>  .../bad/yaml-cont-align.yaml                  | 30 +++++++++
>  .../dt-style-selftest/bad/yaml-hex-case.yaml  | 29 ++++++++
>  .../bad/yaml-indent-strict.yaml               | 29 ++++++++
>  .../bad/yaml-line-length.yaml                 | 29 ++++++++
>  .../bad/yaml-mixed-indent.yaml                | 29 ++++++++
>  .../bad/yaml-node-close.yaml                  | 31 +++++++++
>  .../bad/yaml-prop-order.yaml                  | 29 ++++++++
>  .../bad/yaml-prop-pairing.yaml                | 33 +++++++++
>  .../bad/yaml-required-blank.yaml              | 33 +++++++++
>  .../dtc/dt-style-selftest/bad/yaml-tab.yaml   | 29 ++++++++
>  .../bad/yaml-trailing-ws.yaml                 | 29 ++++++++
>  .../dt-style-selftest/bad/yaml-unit-addr.yaml | 29 ++++++++
>  .../bad/yaml-unused-label.yaml                | 29 ++++++++
>  .../dt-style-selftest/bad/yaml-value-ws.yaml  | 29 ++++++++
>  .../expected/dts-spaces.dts.txt               |  2 +
>  .../expected/yaml-child-addr-order.yaml.txt   |  2 +
>  .../expected/yaml-child-name-order.yaml.txt   |  2 +
>  .../expected/yaml-cont-align.yaml.txt         |  2 +
>  .../expected/yaml-hex-case.yaml.txt           |  2 +
>  .../expected/yaml-indent-strict.yaml.txt      |  2 +
>  .../expected/yaml-line-length.yaml.txt        |  2 +
>  .../expected/yaml-mixed-indent.yaml.txt       |  3 +
>  .../expected/yaml-node-close.yaml.txt         |  2 +
>  .../expected/yaml-prop-order.yaml.txt         |  2 +
>  .../expected/yaml-prop-pairing.yaml.txt       |  3 +
>  .../expected/yaml-required-blank.yaml.txt     |  3 +
>  .../expected/yaml-tab.yaml.txt                |  2 +
>  .../expected/yaml-trailing-ws.yaml.txt        |  2 +
>  .../expected/yaml-unit-addr.yaml.txt          |  2 +
>  .../expected/yaml-unused-label.yaml.txt       |  2 +
>  .../expected/yaml-value-ws.yaml.txt           |  2 +

All these .txt files need a newline at the end.

>  .../dtc/dt-style-selftest/good/dts-tab.dts    | 30 +++++++++
>  .../dt-style-selftest/good/yaml-4space.yaml   | 41 ++++++++++++
>  scripts/dtc/dt-style-selftest/run.sh          | 67 +++++++++++++++++++
>  38 files changed, 689 insertions(+)
