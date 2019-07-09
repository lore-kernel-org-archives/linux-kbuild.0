Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfGIOxl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 10:53:41 -0400
Subject: Re: [PATCH v7 16/18] MAINTAINERS: add entry for KUnit the unit
 testing framework
References: <20190709063023.251446-1-brendanhiggins@google.com>
 <20190709063023.251446-17-brendanhiggins@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <7cc417dd-036f-7dc1-6814-b1fdac810f03@kernel.org>
Date: Tue, 9 Jul 2019 08:53:19 -0600
MIME-Version: 1.0
In-Reply-To: <20190709063023.251446-17-brendanhiggins@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, shuah <shuah@kernel.org>

On 7/9/19 12:30 AM, Brendan Higgins wrote:
> Add myself as maintainer of KUnit, the Linux kernel's unit testing
> framework.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>   MAINTAINERS | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 677ef41cb012c..48d04d180a988 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8599,6 +8599,17 @@ S:	Maintained
>   F:	tools/testing/selftests/
>   F:	Documentation/dev-tools/kselftest*
>   
> +KERNEL UNIT TESTING FRAMEWORK (KUnit)
> +M:	Brendan Higgins <brendanhiggins@google.com>
> +L:	linux-kselftest@vger.kernel.org
> +L:	kunit-dev@googlegroups.com
> +W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
> +S:	Maintained
> +F:	Documentation/dev-tools/kunit/
> +F:	include/kunit/
> +F:	kunit/
> +F:	tools/testing/kunit/
> +
>   KERNEL USERMODE HELPER
>   M:	Luis Chamberlain <mcgrof@kernel.org>
>   L:	linux-kernel@vger.kernel.org
> 

Thanks Brendan.

I am good with this. I can take KUnit patches through kselftest
with your Ack.

thanks,
-- Shuah
