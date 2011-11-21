Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e8.ny.us.ibm.com ([32.97.182.138]:44777 "EHLO e8.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752793Ab1KUURR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 15:17:17 -0500
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <john.stultz@linaro.org>;
	Mon, 21 Nov 2011 15:17:16 -0500
Message-ID: <1321906482.6445.11.camel@work-vm>
Subject: Re: [PATCH 2/2] merge_config.sh: whitespace cleanup
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 21 Nov 2011 12:14:42 -0800
In-Reply-To: <03c7cecf272a4ff0de166ee9dd7b71c920981a31.1321904550.git.dvhart@linux.intel.com>
References: <1321567131.25715.32.camel@work-vm>
	 <03c7cecf272a4ff0de166ee9dd7b71c920981a31.1321904550.git.dvhart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, Dmitry Fink <Dmitry.Fink@palm.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Richard Tartler <Reinhard.Tartler@informatik.uni-erlangen.de>

On Mon, 2011-11-21 at 11:42 -0800, Darren Hart wrote:
> Fix whitespace usage in the clean_up routine.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>

Acked-by: John Stultz <john.stultz@linaro.org>

> ---
>  scripts/kconfig/merge_config.sh |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index b91015d..07bb886 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -21,8 +21,8 @@
>  #  See the GNU General Public License for more details.
> 
>  clean_up() {
> -       rm -f $TMP_FILE
> -       exit
> +	rm -f $TMP_FILE
> +	exit
>  }
>  trap clean_up HUP INT TERM
> 


