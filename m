Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud2.xs4all.net ([194.109.24.21]:57294 "EHLO
	lb1-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753448AbbDIMsB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 08:48:01 -0400
Message-ID: <1428583676.14000.50.camel@x220>
Subject: Re: [PATCH 2/2] kconfig: Do not print status messages in make -s
 mode
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 09 Apr 2015 14:47:56 +0200
In-Reply-To: <1428493376-20197-2-git-send-email-mmarek@suse.cz>
References: <1428493376-20197-1-git-send-email-mmarek@suse.cz>
	 <1428493376-20197-2-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Wed, 2015-04-08 at 13:42 +0200, Michal Marek wrote:
> Add an -s option to the conf, mconf, qconf and gconf frontends and pass
> it when make -s is used.

Basically this suppresses everything except warning and errors,
correct? 

I don't actually use nconf. Is it already silent?

>  Also, use $(kecho) instead of @echo in the
> Makefile.

(I had to look up $(kecho). I found:
    ###
    # Easy method for doing a status message
           kecho := :
     quiet_kecho := echo
    silent_kecho := :
    kecho := $($(quiet)kecho)

I'm not fluent in Makefilese. What does it provide beyond @echo?)

> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -471,7 +471,7 @@ static struct option long_opts[] = {
>  static void conf_usage(const char *progname)
>  {
>  
> -	printf("Usage: %s [option] <kconfig-file>\n", progname);
> +	printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
>  	printf("[option] is _one_ of the following:\n");
>  	printf("  --listnewconfig         List new options\n");
>  	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
> @@ -501,7 +501,11 @@ int main(int ac, char **av)
>  
>  	tty_stdio = isatty(0) && isatty(1) && isatty(2);
>  
> -	while ((opt = getopt_long(ac, av, "", long_opts, NULL)) != -1) {
> +	while ((opt = getopt_long(ac, av, "s", long_opts, NULL)) != -1) {
> +		if (opt == 's') {
> +			conf_set_message_callback(NULL);
> +			continue;
> +		}
>  		input_mode = (enum input_mode)opt;
>  		switch (opt) {
>  		case silentoldconfig:
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 344b9e3..26d208b 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -1474,9 +1474,12 @@ int main(int ac, char *av[])
>  		case 'a':
>  			//showAll = 1;
>  			break;
> +		case 's':
> +			conf_set_message_callback(NULL);
> +			break;
>  		case 'h':
>  		case '?':
> -			printf("%s <config>\n", av[0]);
> +			printf("%s [-s] <config>\n", av[0]);
>  			exit(0);
>  		}
>  		name = av[2];
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 4dd3755..01070f0 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -279,6 +279,7 @@ static int child_count;
>  static int single_menu_mode;
>  static int show_all_options;
>  static int save_and_exit;
> +static int silent;
>  
>  static void conf(struct menu *menu, struct menu *active_menu);
>  static void conf_choice(struct menu *menu);
> @@ -777,10 +778,12 @@ static void conf_message_callback(const char *fmt, va_list ap)
>  	char buf[PATH_MAX+1];
>  
>  	vsnprintf(buf, sizeof(buf), fmt, ap);
> -	if (save_and_exit)
> -		printf("%s", buf);
> -	else
> +	if (save_and_exit) {
> +		if (!silent)
> +			printf("%s", buf);
> +	} else {
>  		show_textbox(NULL, buf, 6, 60);
> +	}
>  }
>  
>  static void show_help(struct menu *menu)

The patch adds this :
    conf_set_message_callback(NULL);

for conf, gconf, and qconf. That won't work for mconf?

> @@ -977,16 +980,18 @@ static int handle_exit(void)
>  		}
>  		/* fall through */
>  	case -1:
> -		printf(_("\n\n"
> -			 "*** End of the configuration.\n"
> -			 "*** Execute 'make' to start the build or try 'make help'."
> -			 "\n\n"));
> +		if (!silent)
> +			printf(_("\n\n"
> +				 "*** End of the configuration.\n"
> +				 "*** Execute 'make' to start the build or try 'make help'."
> +				 "\n\n"));
>  		res = 0;
>  		break;
>  	default:
> -		fprintf(stderr, _("\n\n"
> -				  "Your configuration changes were NOT saved."
> -				  "\n\n"));
> +		if (!silent)
> +			fprintf(stderr, _("\n\n"
> +					  "Your configuration changes were NOT saved."
> +					  "\n\n"));
>  		if (res != KEY_ESC)
>  			res = 0;
>  	}
> @@ -1010,6 +1015,10 @@ int main(int ac, char **av)
>  
>  	signal(SIGINT, sig_handler);
>  
> +	if (ac > 1 && strcmp(av[1], "-s") == 0) {
> +		silent = 1;
> +		av++;
> +	}
>  	conf_parse(av[1]);
>  	conf_read(NULL);
>  
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 9d3b04b..c3bb7fe 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1746,7 +1746,7 @@ static const char *progname;
>  
>  static void usage(void)
>  {
> -	printf(_("%s <config>\n"), progname);
> +	printf(_("%s [-s] <config>\n"), progname);
>  	exit(0);
>  }
>  
> @@ -1762,6 +1762,9 @@ int main(int ac, char** av)
>  	configApp = new QApplication(ac, av);
>  	if (ac > 1 && av[1][0] == '-') {
>  		switch (av[1][1]) {
> +		case 's':
> +			conf_set_message_callback(NULL);
> +			break;
>  		case 'h':
>  		case '?':
>  			usage();


Paul Bolle

