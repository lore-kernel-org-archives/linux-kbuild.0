Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48827 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752664AbcDTItp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2016 04:49:45 -0400
Date: Wed, 20 Apr 2016 10:49:43 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/2] kbuild: rename cmd_cc_i_c to cmd_cpp_i_c
Message-ID: <20160420084943.GG15339@pobox.suse.cz>
References: <1460082288-31817-1-git-send-email-yamada.masahiro@socionext.com> <20160408150057.GF5327@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160408150057.GF5327@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Aaro Koskinen <aaro.koskinen@nokia.com>, Adrian Hunter <adrian.hunter@intel.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Lukas Wunner <lukas@wunner.de>, Jiri Olsa <jolsa@kernel.org>

On Fri, Apr 08, 2016 at 12:00:57PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Fri, Apr 08, 2016 at 11:24:47AM +0900, Masahiro Yamada escreveu:
> > This command just preprocesses .c files into .i files, so cmd_cpp_i_c
> > seems more suitable.
> 
> Thanks for doing it to the tools/build/ copy, looks sensible, I guess
> this can go via the kbuild tree?
> 
> Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> - Arnaldo
>  
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied both patches to kbuild.git#kbuild.

Michal
