Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-il1-f193.google.com ([209.85.166.193]:37277 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgF2VZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 17:25:22 -0400
Date: Mon, 29 Jun 2020 15:25:19 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: copy process-schema-examples.yaml to
 process-schema.yaml
Message-ID: <20200629212519.GA2935789@bogus>
References: <20200625170434.635114-1-masahiroy@kernel.org>
 <20200625170434.635114-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625170434.635114-4-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

On Fri, 26 Jun 2020 02:04:33 +0900, Masahiro Yamada wrote:
> There are two processed schema files:
> 
>  - processed-schema-examples.yaml
> 
>     Used for 'make dt_binding_check'. This is always a full schema.
> 
>  - processed-schema.yaml
> 
>     Used for 'make dtbs_check'. This may be a full schema, or a smaller
>     subset if DT_SCHEMA_FILES is given by a user.
> 
> If DT_SCHEMA_FILES is not specified, they are the same. You can copy
> the former to the latter instead of running dt-mk-schema twice. This
> saves the cpu time a lot when you do 'make dt_binding_check dtbs_check'
> because building the full schema takes a couple of seconds.
> 
> If DT_SCHEMA_FILES is specified, processed-schema.yaml is generated
> based on the specified yaml files.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/devicetree/bindings/Makefile | 28 +++++++++++++++-------
>  scripts/Makefile.lib                       |  3 +++
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 

Applied, thanks!
