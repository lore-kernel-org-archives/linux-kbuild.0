Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-il1-f196.google.com ([209.85.166.196]:46325 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391015AbgF2VYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 17:24:40 -0400
Date: Mon, 29 Jun 2020 15:24:36 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: fix error in 'make clean' after 'make
 dt_binding_check'
Message-ID: <20200629212436.GA2933965@bogus>
References: <20200625170434.635114-1-masahiroy@kernel.org>
 <20200625170434.635114-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625170434.635114-2-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>

On Fri, 26 Jun 2020 02:04:31 +0900, Masahiro Yamada wrote:
> We are having more and more schema files.
> 
> Commit 8b6b80218b01 ("dt-bindings: Fix command line length limit
> calling dt-mk-schema") fixed the 'Argument list too long' error of
> the schema checks, but the same error happens while cleaning too.
> 
> 'make clean' after 'make dt_binding_check' fails as follows:
> 
>   $ make dt_binding_check
>     [ snip ]
>   $ make clean
>   make[2]: execvp: /bin/sh: Argument list too long
>   make[2]: *** [scripts/Makefile.clean:52: __clean] Error 127
>   make[1]: *** [scripts/Makefile.clean:66: Documentation/devicetree/bindings] Error 2
>   make: *** [Makefile:1763: _clean_Documentation] Error 2
> 
> 'make dt_binding_check' generates so many .example.dts, .dt.yaml files,
> which are passed to the 'rm' command when you run 'make clean'.
> 
> I added a small hack to use the 'find' command to clean up most of the
> build artifacts before they are processed by scripts/Makefile.clean
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/devicetree/bindings/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Applied, thanks!
