Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f65.google.com ([209.85.166.65]:44579 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391035AbgF2VYx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 17:24:53 -0400
Date: Mon, 29 Jun 2020 15:24:49 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: do not build processed-schema.yaml for
 'make dt_binding_check'
Message-ID: <20200629212449.GA2934414@bogus>
References: <20200625170434.635114-1-masahiroy@kernel.org>
 <20200625170434.635114-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625170434.635114-3-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, 26 Jun 2020 02:04:32 +0900, Masahiro Yamada wrote:
> Currently, processed-schema.yaml is always built, but it is actually
> used only for 'make dtbs_check'.
> 
> 'make dt_binding_check' uses processed-schema-example.yaml instead.
> 
> Build processed-schema.yaml only for 'make dtbs_check'.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/devicetree/bindings/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
