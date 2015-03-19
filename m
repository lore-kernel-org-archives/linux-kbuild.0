Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:37094 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755118AbbCSNlB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Mar 2015 09:41:01 -0400
Date: Thu, 19 Mar 2015 13:40:27 +0000
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [patch 1/7] dt: dtb version: consolidate documentation of chosen
 node bindings
Message-ID: <20150319134027.GE18473@leverpostej>
References: <550A42AC.8060104@gmail.com>
 <550A4326.2070801@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <550A4326.2070801@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, Michal Marek <mmarek@suse.cz>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Leif Lindholm <leif.lindholm@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>

On Thu, Mar 19, 2015 at 03:31:50AM +0000, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand@sonymobile.com>
> 
> Documentation of bindings in node /chosen are scattered in several bindings
> files.  If not already in Documentation/devicetree/bindings/chosen.txt, add
> a pointer in that file to where the property and node bindings are described.
> 
> This is a clean up in anticipation of adding another node binding in /chosen.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
> ---
>  Documentation/devicetree/bindings/chosen.txt |   31 +++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> Index: b/Documentation/devicetree/bindings/chosen.txt
> ===================================================================
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -44,3 +44,34 @@ Implementation note: Linux will look for
>  on PowerPC "stdout" if "stdout-path" is not found.  However, the
>  "linux,stdout-path" and "stdout" properties are deprecated. New platforms
>  should only use the "stdout-path" property.
> +
> +
> +Properties documented in other bindings
> +---------------------------------------
> +#address-cells                          video/simple-framebuffer-sunxi.txt
> +
> +#size-cells                             video/simple-framebuffer-sunxi.txt
> +
> +bootargs                                booting-without-of.txt
> +                                        usage-model.txt
> +
> +initrd-end                              usage-model.txt
> +initrd-start                            usage-model.txt
> +
> +interrupt-controller (obsolete)         booting-without-of.txt
> +
> +linux,pci-probe-only                    pci/host-generic-pci.txt
> +
> +linux,stdout-path                       booting-without-of.txt
> +
> +ranges                                  video/simple-framebuffer-sunxi.txt
> +
> +stdout-path                             video/simple-framebuffer.txt

The usual form of stdout-path is documented immediately above this
section. That should probably be updated to refer to the
video/simple-framebuffer.txt case.

Mark.
