Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www62.your-server.de ([213.133.104.62]:58484 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730004AbgCDSkI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 13:40:08 -0500
Subject: Re: [PATCH bpf-next v2] kbuild: Remove debug info from kallsyms
 linking
References: <202003031814.4AEA3351@keescook>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <9dd690e8-868d-d463-6b85-14270fdcc210@iogearbox.net>
Date: Wed, 4 Mar 2020 19:40:05 +0100
MIME-Version: 1.0
In-Reply-To: <202003031814.4AEA3351@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, linux-kbuild@vger.kernel.org, andriin@fb.com

On 3/4/20 3:18 AM, Kees Cook wrote:
> When CONFIG_DEBUG_INFO is enabled, the two kallsyms linking steps spend
> time collecting and writing the dwarf sections to the temporary output
> files. kallsyms does not need this information, and leaving it off
> halves their linking time. This is especially noticeable without
> CONFIG_DEBUG_INFO_REDUCED. The BTF linking stage, however, does still
> need those details.
> 
> Refactor the BTF and kallsyms generation stages slightly for more
> regularized temporary names. Skip debug during kallsyms links.
> Additionally move "info BTF" to the correct place since commit
> 8959e39272d6 ("kbuild: Parameterize kallsyms generation and correct
> reporting"), which added "info LD ..." to vmlinux_link calls.
> 
> For a full debug info build with BTF, my link time goes from 1m06s to
> 0m54s, saving about 12 seconds, or 18%.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Acked-by: Andrii Nakryiko <andriin@fb.com>

Applied, thanks!
