Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842590;
	b=M5du6xCSsmolrQ23kEFE2oEioGQv+uQv8IlqOFDEREmcken5yZKKIODnTq4WMEX/+IJt
	 Tw1KtuZ17y6sAEHwriQatFU66JcRX/ntlOVuuPX7HeN3KynIGrkuxAS+dOJm4P5zJ0LW1
	 BsRxc1e4NXZ3zwzxLWiGJ5XQVGIDFKe/iO+A/RynvwbW1P/+LyEJX0vkbnKXBuPiSca7J
	 72N+yImU4vN9gDTT6XzvlXkS7BmHlwsXdxexn1yFU2oFmFfDnfQEIOYU5FUsZVJT1hMxA
	 ZQCkZNTdxvxtdEFCo5gS1QBxE4af6pL3k1B1gPCUesxT8/7kcYGIapOybJVy3Br6HnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842590;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nnlsGm7gSjn3L349Y2w27ueF+9G+iz/zfA85TY95v2g=;
	b=wUQFTEe9Gf6RXRRXIn30yI4W1Cl7mWb4/JFqnVsJkdoMmhdNoPCP59/5U7xoYq3TmAGc
	 siUY3IqtmR4traeOgund8jRYY5avmzSBQ1k83znv30CxZtr03BH+ChU5IxwEfOC9U6y4M
	 7Cy/T1WROGdQJabudEeJxdI7XDQW+gkCjlfg0c19oHZokpdAJ3kj61lepRqaj9A7ynttC
	 33IKOgfl3k5KZ4C5kqZcIehyGI3alDu9uTCTXMzH7EcoGZg1rJxyYP+l49ZY2iN1Cr48+
	 VUw6Zh/USO05WT4jxE+xFeyhPEVhatA8+4dgjAEsliL2TYQCgWxWnRb+8BDUMbQ7Jxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=NSlRaR3Z;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B592606A32F
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 15:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B592606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=NSlRaR3Z
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 177673FC17;
	Mon, 16 Nov 2026 16:23:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 059841FB83B;
	Mon, 16 Nov 2026 16:23:02 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id oK0lvL0PAeRF; Mon, 16 Nov 2026 16:23:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 274721FBB9B;
	Mon, 16 Nov 2026 16:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 274721FBB9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1794842581;
	bh=nnlsGm7gSjn3L349Y2w27ueF+9G+iz/zfA85TY95v2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=NSlRaR3Zs0+DqflOoB173xkWIS5r+MFox4Je3RoHI5nKqxmGwmi6ri0hLgLYdDU0q
	 d/Xi83hhbSPOIHyVrcXKEC3J7OBrGawVuJT/vNhZApqlv4hKdUHloALuGQKGR1Z7jQ
	 OXnv4I7iW2HqzPVUGW35kK+TiOKzGz678o5jf6wAfVB2vDIMwmo1kFzMkqHc4Q37Jp
	 lEEgMuGx/+Dc29XzVOEl76vsPiYIXPcE/fkyPN+7pFxPqrQJegvtsjNFOhgk11zfA6
	 pTV/nwB9ig1Xe/3n9lSmYW7WSMaQyCWgMIP2e/KwKthiWOzVGKcWLJDFdMYhtycAQ1
	 jeqjdW58+VqlQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id JbcmDmaYNdQT; Mon, 16 Nov 2026 16:23:01 +0100 (CET)
Received: from [10.16.23.62] (unknown [193.30.133.7])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id DB6F51FB83B;
	Mon, 16 Nov 2026 16:23:00 +0100 (CET)
Message-ID: <04c688c7-8357-492e-86f3-587ced46920c@tngtech.com>
Date: Mon, 16 Nov 2026 16:22:55 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Tools using the generated kernel SBOM as input
To: Andre Wagner <wagnerandre85@aol.de>,
 Luis Augenstein <luis.augenstein@tngtech.com>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
References: <1313907070.258672.1793951761777.ref@mail.yahoo.com>
 <1313907070.258672.1793951761777@mail.yahoo.com>
 <576e1f86-1d8b-4b15-b0fb-cf8c66cb62c8@tngtech.com>
 <1306981829.274903.1794811991520@mail.yahoo.com>
Content-Language: en-US
From: Maximilian Huber <maximilian.huber@tngtech.com>
In-Reply-To: <1306981829.274903.1794811991520@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey Andr=C3=A9,

There are tools that allow you to convert SPDX to CDX and therefore no=20
support of CDX is planned.

One of the goals was to keep the complexity small so we designed it=20
around one format. The burden of supporting multiple formats should not=20
be put on this small implementation and is better put in the consuming=20
tools.

DependencyTrack is lacking SPDX support for political reasons [1] and=20
the issue to add support back is still open [2].

Greetings,
Max

[1] https://github.com/DependencyTrack/dependency-track/issues/1053
[2] https://github.com/DependencyTrack/dependency-track/issues/1746

On 11/16/26 07:53, Andre Wagner wrote:
> Hi Luis,
> thank you very much for this information! Is there also a SBOM output i=
n=20
> CycloneDX format planned?
>=20
> A use case could be to use the filenames of the sources SBOM as a=20
> primary identifier and match them with the CVEs listed in https://=20
> git.kernel.org/pub/scm/linux/security/vulns.git/ <https://=20
> git.kernel.org/pub/scm/linux/security/vulns.git/>.
>=20
> Would be great if this could be done one day automatically in OWASP=20
> DependencyTrack (https://dependencytrack.org/ <https://=20
> dependencytrack.org/>) or similar. An implementation in DependencyTrack=
=20
> I would definitely support with coding.
>=20
> Greetings,
> Andr=C3=A9
>=20
> On Sunday, November 8, 2026 at 03:04:53 PM GMT+1, Luis Augenstein=20
> <luis.augenstein@tngtech.com> wrote:
>=20
>=20
>=20
>     On 11/6/26 08:56, Andre Wagner wrote:
>      > Hello @all,
>      > May I ask which tools you use for consuming the generated kernel
>     SBOM?
>      > Greetings,
>      > Andr=C3=A9
>=20
>     Hi Andr=C3=A9,
>=20
>     The kernel SBOM documents are SPDX 3.0.1 JSON-LD, so any tooling th=
at
>     supports SPDX 3 should be able to work with them.
>=20
>     For example, I've used the official SPDX Java tools [1] to verify t=
he
>     validity of the documents. Note, however, that the Java tools curre=
ntly
>     do not support the custom JSON-LD contexts used by the kernel SBOM
>     documents. These contexts must first be expanded manually. More
>     information on this in the documentation [2].
>=20
>     Another useful tool I've come across is spdx3_viz [3]. It allows yo=
u to
>     upload all three kernel SBOM documents (source, build, and output)
>     together and interactively explore the discovered licenses and the
>     files
>     they are assigned to.
>=20
>     [1] https://github.com/spdx/tools-java <https://github.com/spdx/
>     tools-java>
>     [2] https://docs.kernel.org/tools/sbom/sbom.html#output-format
>     <https://docs.kernel.org/tools/sbom/sbom.html#output-format>
>     [3] https://github.com/kartben/spdx3_viz <https://github.com/
>     kartben/spdx3_viz>
>=20
>     Best,
>     Luis
>=20
>     --=20
>     Luis Augenstein * luis.augenstein@tngtech.com
>     <mailto:luis.augenstein@tngtech.com> * +4915225275761
>     TNG Technology Consulting GmbH, Beta-Str. 13, 85774 Unterf=C3=B6hri=
ng
>     Gesch=C3=A4ftsf=C3=BChrer: Dr. Robert Dahlke, Thomas Endres, Moritz=
 Prinz
>     Aufsichtsratsvorsitzender: Henrik Klagges
>     Sitz: Unterf=C3=B6hring * Registergericht: Amtsgericht M=C3=BCnchen=
 *
>     Handelsregisternummer: HRB 135082
>=20

--=20
Maximilian Huber * Principal Consultant
maximilian.huber@tngtech.com * +49-174-3410223
TNG Technology Consulting GmbH, Beta-Stra=C3=9Fe 13, 85774 Unterf=C3=B6hr=
ing
Gesch=C3=A4ftsf=C3=BChrer: Dr. Robert Dahlke, Thomas Endres, Moritz Prinz
Aufsichtsratsvorsitzender: Henrik Klagges
Sitz: Unterf=C3=B6hring * Registergericht: Amtsgericht M=C3=BCnchen *=20
Handelsregisternummer: HRB 135082

